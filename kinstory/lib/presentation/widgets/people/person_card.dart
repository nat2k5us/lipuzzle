import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/datasources/local/mock_database.dart';

class PersonCard extends StatelessWidget {
  final MockPerson person;
  final VoidCallback onTap;

  const PersonCard({
    super.key,
    required this.person,
    required this.onTap,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM d, y').format(date);
  }

  String _calculateAge() {
    if (person.birthDate == null) return '';

    final endDate = person.deathDate ?? DateTime.now();
    final age = endDate.year - person.birthDate!.year;

    if (person.deathDate != null) {
      return '$age years old at death';
    } else {
      return '$age years old';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: person.gender == 'male'
                    ? Colors.blue.shade100
                    : Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  person.gender == 'male' ? Icons.male : Icons.female,
                  size: 30,
                  color: person.gender == 'male' ? Colors.blue : Colors.pink,
                ),
              ),

              const SizedBox(width: 16),

              // Person details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      '${person.firstName} ${person.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Birth info
                    if (person.birthDate != null) ...[
                      Row(
                        children: [
                          Icon(
                            Icons.cake,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Born ${_formatDate(person.birthDate)}${person.birthPlace != null ? ' in ${person.birthPlace}' : ''}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                    ],

                    // Age or death info
                    if (person.deathDate != null) ...[
                      Row(
                        children: [
                          Icon(
                            Icons.event_note,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Died ${_formatDate(person.deathDate)}${person.deathPlace != null ? ' in ${person.deathPlace}' : ''}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                    ],

                    // Age
                    if (person.birthDate != null) ...[
                      Text(
                        _calculateAge(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],

                    // Bio preview
                    if (person.bio != null && person.bio!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        person.bio!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Status indicator and arrow
              Column(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: person.deathDate == null ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}