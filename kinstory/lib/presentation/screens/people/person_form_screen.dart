import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/person_providers.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/common/loading_overlay.dart';

class PersonFormScreen extends ConsumerStatefulWidget {
  final String? personId; // null for new person, id for editing

  const PersonFormScreen({
    super.key,
    this.personId,
  });

  @override
  ConsumerState<PersonFormScreen> createState() => _PersonFormScreenState();
}

class _PersonFormScreenState extends ConsumerState<PersonFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _deathPlaceController = TextEditingController();
  final _bioController = TextEditingController();

  DateTime? _selectedBirthDate;
  DateTime? _selectedDeathDate;
  String _selectedGender = 'male';
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.personId != null && widget.personId != 'new';

    if (_isEditing) {
      // Load existing person data
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadPersonData();
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthPlaceController.dispose();
    _deathPlaceController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _loadPersonData() async {
    if (widget.personId == null || widget.personId == 'new') return;

    final personAsync = await ref.read(personProvider(widget.personId!).future);
    if (personAsync != null) {
      setState(() {
        _firstNameController.text = personAsync.firstName;
        _lastNameController.text = personAsync.lastName ?? '';
        _birthPlaceController.text = personAsync.birthPlace ?? '';
        _deathPlaceController.text = personAsync.deathPlace ?? '';
        _bioController.text = personAsync.bio ?? '';
        _selectedBirthDate = personAsync.birthDate;
        _selectedDeathDate = personAsync.deathDate;
        _selectedGender = personAsync.gender;
      });

      // Also update the form controller
      final controller = ref.read(personFormControllerProvider.notifier);
      controller.loadPersonData(personAsync);
    }
  }

  Future<void> _selectDate(BuildContext context, bool isBirthDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isBirthDate
        ? (_selectedBirthDate ?? DateTime.now().subtract(const Duration(days: 365 * 25)))
        : (_selectedDeathDate ?? DateTime.now()),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isBirthDate) {
          _selectedBirthDate = picked;
          ref.read(personFormControllerProvider.notifier).updateBirthDate(picked);
        } else {
          _selectedDeathDate = picked;
          ref.read(personFormControllerProvider.notifier).updateDeathDate(picked);
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM d, y').format(date);
  }

  Future<void> _savePerson() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = ref.read(personFormControllerProvider.notifier);

    // Update form controller with current values
    controller.updateFirstName(_firstNameController.text.trim());
    controller.updateLastName(_lastNameController.text.trim());
    controller.updateBirthPlace(_birthPlaceController.text.trim().isEmpty
      ? null : _birthPlaceController.text.trim());
    controller.updateDeathPlace(_deathPlaceController.text.trim().isEmpty
      ? null : _deathPlaceController.text.trim());
    controller.updateBio(_bioController.text.trim().isEmpty
      ? null : _bioController.text.trim());
    controller.updateGender(_selectedGender);

    // Save the person
    final success = await controller.savePerson(
      existingPersonId: _isEditing ? widget.personId : null,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing
              ? 'Person updated successfully!'
              : 'Person added successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate back to people list
      context.go('/dashboard/people');
    } else if (mounted) {
      final formState = ref.read(personFormControllerProvider);
      if (formState.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(formState.error!),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(personFormControllerProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Edit Family Member' : 'Add Family Member',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.teal),
          onPressed: () => context.go('/dashboard/people'),
        ),
        actions: [
          TextButton(
            onPressed: formState.isLoading ? null : _savePerson,
            child: Text(
              _isEditing ? 'Update' : 'Save',
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: formState.isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Personal Information Section
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),

                // Name fields
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _firstNameController,
                        label: 'First Name',
                        hintText: 'Enter first name',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'First name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        controller: _lastNameController,
                        label: 'Last Name',
                        hintText: 'Enter last name',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Last name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Gender selection
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Male'),
                        value: 'male',
                        groupValue: _selectedGender,
                        activeColor: Colors.teal,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Female'),
                        value: 'female',
                        groupValue: _selectedGender,
                        activeColor: Colors.teal,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Birth Information Section
                const Text(
                  'Birth Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),

                // Birth date
                GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.teal),
                        const SizedBox(width: 12),
                        Text(
                          _selectedBirthDate != null
                            ? 'Birth Date: ${_formatDate(_selectedBirthDate)}'
                            : 'Select Birth Date',
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedBirthDate != null
                              ? Colors.black87
                              : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Birth place
                CustomTextField(
                  controller: _birthPlaceController,
                  label: 'Birth Place (Optional)',
                  hintText: 'Enter birth place',
                ),

                const SizedBox(height: 24),

                // Death Information Section
                const Text(
                  'Death Information (Optional)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),

                // Death date
                GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.event_note, color: Colors.teal),
                        const SizedBox(width: 12),
                        Text(
                          _selectedDeathDate != null
                            ? 'Death Date: ${_formatDate(_selectedDeathDate)}'
                            : 'Select Death Date (if applicable)',
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedDeathDate != null
                              ? Colors.black87
                              : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Death place
                CustomTextField(
                  controller: _deathPlaceController,
                  label: 'Death Place (Optional)',
                  hintText: 'Enter death place',
                ),

                const SizedBox(height: 24),

                // Biography Section
                const Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),

                // Bio text area
                CustomTextField(
                  controller: _bioController,
                  label: 'Biography (Optional)',
                  hintText: 'Tell their story...',
                  maxLines: 5,
                ),

                const SizedBox(height: 32),

                // Save button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: formState.isLoading ? null : _savePerson,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                    ),
                    child: formState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          _isEditing ? 'Update Family Member' : 'Add Family Member',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
