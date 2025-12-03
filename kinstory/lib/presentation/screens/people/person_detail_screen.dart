import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/person_providers.dart';
import '../../providers/tree_providers.dart';
import '../../../data/datasources/local/mock_database.dart';

class PersonDetailScreen extends ConsumerWidget {
  final String personId;

  const PersonDetailScreen({
    super.key,
    required this.personId,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown';
    return DateFormat('MMMM d, y').format(date);
  }

  String? _customFieldString(MockPerson person, String key) {
    final value = person.customFields[key];
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isNotEmpty) {
        return trimmed;
      }
    }
    return null;
  }

  String _calculateAge(DateTime? birthDate, DateTime? deathDate) {
    if (birthDate == null) return 'Unknown';

    final endDate = deathDate ?? DateTime.now();
    final age = endDate.year - birthDate.year;

    if (deathDate != null) {
      return '$age years (at death)';
    } else {
      return '$age years old';
    }
  }

  String _formatRelationshipType(String type) {
    switch (type) {
      case 'spouse':
        return 'spouse';
      case 'biological_parent':
        return 'parent';
      case 'biological_child':
        return 'child';
      case 'sibling':
        return 'sibling';
      default:
        return type.replaceAll('_', ' ');
    }
  }

  String _getPersonName(List<MockPerson> persons, String personId) {
    try {
      final person = persons.firstWhere((p) => p.id == personId);
      final last = person.lastName;
      if (last == null || last.isEmpty) {
        return person.firstName;
      }
      return '${person.firstName} $last';
    } catch (e) {
      return 'Unknown';
    }
  }

  IconData _getRelationshipIcon(String type) {
    switch (type) {
      case 'spouse':
        return Icons.favorite;
      case 'biological_parent':
      case 'biological_child':
        return Icons.family_restroom;
      case 'sibling':
        return Icons.people;
      default:
        return Icons.link;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personAsync = ref.watch(personProvider(personId));
    final allPersonsAsync = ref.watch(personsProvider);
    final allRelationshipsAsync = ref.watch(personRelationshipsProvider(personId));

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: personAsync.when(
        data: (person) {
          if (person == null) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Person Not Found'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.go('/dashboard/people'),
                ),
              ),
              body: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_off, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Person not found',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              // App bar with person info
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                backgroundColor: person.gender == 'male' ? Colors.blue : Colors.pink,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => context.go('/dashboard/people'),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () => context.go('/dashboard/person/${person.id}/edit'),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: person.gender == 'male'
                          ? [Colors.blue.shade600, Colors.blue.shade400]
                          : [Colors.pink.shade600, Colors.pink.shade400],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Icon(
                              person.gender == 'male' ? Icons.male : Icons.female,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${person.firstName} ${person.lastName}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _calculateAge(person.birthDate, person.deathDate),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Person details
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Life events card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timeline,
                                    color: Colors.teal,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Life Events',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              _LifeEventItem(
                                icon: Icons.cake,
                                title: 'Birth',
                                date: _customFieldString(person, 'birth_label') ??
                                    _formatDate(person.birthDate),
                                location: _customFieldString(person, 'birth_location') ??
                                    person.birthPlace ??
                                    'Unknown location',
                              ),

                              if (person.deathDate != null) ...[
                                const SizedBox(height: 12),
                                _LifeEventItem(
                                  icon: Icons.event_note,
                                  title: 'Death',
                                  date: _formatDate(person.deathDate),
                                  location: person.deathPlace ?? 'Unknown location',
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Biography card
                      if (person.bio != null && person.bio!.isNotEmpty) ...[
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.book,
                                      color: Colors.orange,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Biography',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  person.bio!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Family connections card
                      allPersonsAsync.when(
                        data: (allPersons) => allRelationshipsAsync.when(
                          data: (allRelationships) {
                            // Filter relationships for this person
                            final personRelationships = allRelationships
                                .where((r) => r.person1Id == personId || r.person2Id == personId)
                                .toList();

                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.family_restroom,
                                          color: Colors.green,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Family Connections',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () => context.go('/dashboard/relationships/new?treeId=${person.treeId}&person1Id=$personId'),
                                          icon: const Icon(Icons.add, color: Colors.green),
                                          tooltip: 'Add Relationship',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    if (personRelationships.isEmpty)
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.info_outline, color: Colors.grey),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'No family connections yet. Add relationships to build the family tree.',
                                                style: TextStyle(color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Column(
                                        children: personRelationships.map((relationship) {
                                          final otherPersonId = relationship.person1Id == personId
                                              ? relationship.person2Id
                                              : relationship.person1Id;
                                          final otherPersonName = _getPersonName(allPersons, otherPersonId);
                                          final relationshipType = _formatRelationshipType(relationship.type);

                                          return Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            child: InkWell(
                                              onTap: () => context.go('/dashboard/relationships/${relationship.id}/edit?treeId=${relationship.treeId}'),
                                              borderRadius: BorderRadius.circular(8),
                                              child: Container(
                                                padding: const EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey.withOpacity(0.3),
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      _getRelationshipIcon(relationship.type),
                                                      color: Colors.green,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            otherPersonName,
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 2),
                                                          Text(
                                                            relationshipType,
                                                            style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.edit,
                                                      color: Colors.grey,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                          loading: () => const Card(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          error: (error, _) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('Error loading relationships: $error'),
                            ),
                          ),
                        ),
                        loading: () => const Card(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        error: (error, _) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Error loading people: $error'),
                          ),
                        ),
                      ),

                      const SizedBox(height: 80), // Space for FAB
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (error, stackTrace) => Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Failed to load person details',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.refresh(personProvider(personId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: personAsync.maybeWhen(
        data: (person) => person != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  onPressed: () => context.go('/dashboard/relationships/new?treeId=${person.treeId}&person1Id=$personId'),
                  backgroundColor: Colors.green,
                  heroTag: "add_relationship",
                  child: const Icon(Icons.link, color: Colors.white),
                  tooltip: 'Add Relationship',
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () => context.go('/dashboard/person/${person.id}/edit'),
                  backgroundColor: Colors.teal,
                  heroTag: "edit_person",
                  child: const Icon(Icons.edit, color: Colors.white),
                  tooltip: 'Edit Person',
                ),
              ],
            )
          : null,
        orElse: () => null,
      ),
    );
  }
}

class _LifeEventItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String location;

  const _LifeEventItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            size: 18,
            color: Colors.teal,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
