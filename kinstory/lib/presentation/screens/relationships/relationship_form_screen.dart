import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/person_providers.dart';
import '../../providers/tree_providers.dart';
import '../../providers/auth_providers.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/common/loading_overlay.dart';
import '../../../data/datasources/local/mock_database.dart';

class RelationshipFormScreen extends ConsumerStatefulWidget {
  final String treeId;
  final String? person1Id; // Pre-selected first person
  final String? relationshipId; // For editing existing relationship

  const RelationshipFormScreen({
    super.key,
    required this.treeId,
    this.person1Id,
    this.relationshipId,
  });

  @override
  ConsumerState<RelationshipFormScreen> createState() => _RelationshipFormScreenState();
}

class _RelationshipFormScreenState extends ConsumerState<RelationshipFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  String? _selectedPerson1Id;
  String? _selectedPerson2Id;
  String _selectedRelationType = 'spouse';
  String _selectedStatus = 'current';
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  bool _isLoading = false;
  String? _error;

  final List<String> _relationshipTypes = [
    'spouse',
    'biological_parent',
    'biological_child',
    'adoptive_parent',
    'adoptive_child',
    'step_parent',
    'step_child',
    'sibling',
    'half_sibling',
    'step_sibling',
  ];

  final List<String> _statuses = [
    'current',
    'ended',
    'divorced',
    'widowed',
    'separated',
  ];

  @override
  void initState() {
    super.initState();
    _selectedPerson1Id = widget.person1Id;

    if (widget.relationshipId != null) {
      // TODO: Load existing relationship data for editing
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String _getRelationshipDisplayName(String type) {
    switch (type) {
      case 'spouse':
        return 'Spouse/Partner';
      case 'biological_parent':
        return 'Biological Parent';
      case 'biological_child':
        return 'Biological Child';
      case 'adoptive_parent':
        return 'Adoptive Parent';
      case 'adoptive_child':
        return 'Adoptive Child';
      case 'step_parent':
        return 'Step Parent';
      case 'step_child':
        return 'Step Child';
      case 'sibling':
        return 'Sibling';
      case 'half_sibling':
        return 'Half Sibling';
      case 'step_sibling':
        return 'Step Sibling';
      default:
        return type;
    }
  }

  String _getStatusDisplayName(String status) {
    switch (status) {
      case 'current':
        return 'Current';
      case 'ended':
        return 'Ended';
      case 'divorced':
        return 'Divorced';
      case 'widowed':
        return 'Widowed';
      case 'separated':
        return 'Separated';
      default:
        return status;
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
        ? (_selectedStartDate ?? DateTime.now().subtract(const Duration(days: 365 * 10)))
        : (_selectedEndDate ?? DateTime.now()),
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
        if (isStartDate) {
          _selectedStartDate = picked;
        } else {
          _selectedEndDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _saveRelationship() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedPerson1Id == null || _selectedPerson2Id == null) {
      setState(() {
        _error = 'Please select both people for the relationship';
      });
      return;
    }

    if (_selectedPerson1Id == _selectedPerson2Id) {
      setState(() {
        _error = 'Cannot create a relationship between the same person';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final database = ref.read(databaseProvider);
      final now = DateTime.now();
      final relationshipId = widget.relationshipId ?? 'relationship-${now.millisecondsSinceEpoch}';

      final relationship = MockRelationship(
        id: relationshipId,
        treeId: widget.treeId,
        type: _selectedRelationType,
        person1Id: _selectedPerson1Id!,
        person2Id: _selectedPerson2Id!,
        startDate: _selectedStartDate,
        endDate: _selectedEndDate,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        status: _selectedStatus,
        createdBy: 'demo-user-123',
        createdAt: widget.relationshipId != null ? now : now,
        updatedAt: now,
      );

      if (widget.relationshipId != null) {
        // Editing - remove old and add new
        database.removeRelationship(widget.relationshipId!);
      }

      database.addRelationship(relationship);

      // Refresh the providers
      ref.invalidate(treeRelationshipsProvider(widget.treeId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.relationshipId != null
                ? 'Relationship updated successfully!'
                : 'Relationship added successfully!',
            ),
            backgroundColor: Colors.green,
          ),
        );

        context.go('/dashboard/tree/${widget.treeId}');
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to save relationship: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final personsAsync = ref.watch(personsProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          widget.relationshipId != null ? 'Edit Relationship' : 'Add Relationship',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.teal),
          onPressed: () => context.go('/dashboard/tree/${widget.treeId}'),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveRelationship,
            child: Text(
              widget.relationshipId != null ? 'Update' : 'Save',
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: personsAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.teal),
          ),
          error: (error, _) => Center(
            child: Text('Error loading family members: $error'),
          ),
          data: (persons) {
            final treePersons = persons.where((p) => p.treeId == widget.treeId).toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_error != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.red.shade200),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade600),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _error!,
                                style: TextStyle(
                                  color: Colors.red.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // People Selection Section
                    const Text(
                      'Select People',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // First Person Dropdown
                    const Text(
                      'First Person',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedPerson1Id,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      hint: const Text('Select first person'),
                      items: treePersons.map((person) {
                        return DropdownMenuItem<String>(
                          value: person.id,
                          child: Text('${person.firstName} ${person.lastName}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPerson1Id = value;
                          _error = null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select the first person';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Relationship Type Dropdown
                    const Text(
                      'Relationship Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedRelationType,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      items: _relationshipTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(_getRelationshipDisplayName(type)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRelationType = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // Second Person Dropdown
                    const Text(
                      'Second Person',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedPerson2Id,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      hint: const Text('Select second person'),
                      items: treePersons
                          .where((person) => person.id != _selectedPerson1Id)
                          .map((person) {
                        return DropdownMenuItem<String>(
                          value: person.id,
                          child: Text('${person.firstName} ${person.lastName}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPerson2Id = value;
                          _error = null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select the second person';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Relationship Details Section
                    const Text(
                      'Relationship Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Status Dropdown
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedStatus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      items: _statuses.map((status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(_getStatusDisplayName(status)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedStatus = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // Start Date
                    const Text(
                      'Start Date (Optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                              _selectedStartDate != null
                                ? 'Start Date: ${_formatDate(_selectedStartDate)}'
                                : 'Select Start Date',
                              style: TextStyle(
                                fontSize: 16,
                                color: _selectedStartDate != null
                                  ? Colors.black87
                                  : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // End Date
                    const Text(
                      'End Date (Optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                              _selectedEndDate != null
                                ? 'End Date: ${_formatDate(_selectedEndDate)}'
                                : 'Select End Date',
                              style: TextStyle(
                                fontSize: 16,
                                color: _selectedEndDate != null
                                  ? Colors.black87
                                  : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Notes
                    CustomTextField(
                      controller: _notesController,
                      label: 'Notes (Optional)',
                      hintText: 'Add any additional notes about this relationship...',
                      maxLines: 3,
                    ),

                    const SizedBox(height: 32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveRelationship,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                        ),
                        child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              widget.relationshipId != null
                                ? 'Update Relationship'
                                : 'Add Relationship',
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
            );
          },
        ),
      ),
    );
  }
}