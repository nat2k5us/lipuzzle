import 'package:flutter/material.dart';
import '../../../data/datasources/local/mock_database.dart';

/// A custom widget to display a person node in the family tree graph.
/// This widget represents a single person with a 3D card-style design
/// inspired by MacFamilyTree 11.
class PersonNodeWidget extends StatelessWidget {
  final MockPerson person;
  final VoidCallback? onTap;

  const PersonNodeWidget({
    Key? key,
    required this.person,
    this.onTap,
  }) : super(key: key);

  Color _getPrimaryColor() {
    // Primary color based on gender
    if (person.gender == 'male') {
      return const Color(0xFF2196F3); // Material Blue
    } else if (person.gender == 'female') {
      return const Color(0xFFE91E63); // Material Pink
    } else {
      return const Color(0xFF9E9E9E); // Material Grey
    }
  }

  Color _getCardColor() {
    // Light card background
    if (person.gender == 'male') {
      return const Color(0xFFE3F2FD); // Light Blue
    } else if (person.gender == 'female') {
      return const Color(0xFFFCE4EC); // Light Pink
    } else {
      return const Color(0xFFF5F5F5); // Light Grey
    }
  }

  IconData _getGenderIcon() {
    if (person.gender == 'male') {
      return Icons.male;
    } else if (person.gender == 'female') {
      return Icons.female;
    } else {
      return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = _getPrimaryColor();
    final cardColor = _getCardColor();
    final isDeceased = person.deathDate != null;
    final displayName = person.lastName != null
        ? '${person.firstName} ${person.lastName}'
        : person.firstName;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          // 3D effect with multiple shadows
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            // Main shadow for depth
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
            // Secondary shadow for more depth
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
            // Top highlight for 3D effect
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              // Gradient background for depth
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  cardColor,
                  cardColor.withOpacity(0.9),
                ],
              ),
              border: Border.all(
                color: primaryColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top colored bar
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withOpacity(0.8),
                        primaryColor,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile photo with avatar image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: person.avatarUrl != null
                              ? _buildAvatarImage(person.avatarUrl!, primaryColor)
                              : Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        primaryColor.withOpacity(0.2),
                                        primaryColor.withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      _getGenderIcon(),
                                      color: primaryColor,
                                      size: 32,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Name
                      Text(
                        displayName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF212121),
                          decoration: isDeceased ? TextDecoration.lineThrough : null,
                          decorationColor: primaryColor,
                          decorationThickness: 2,
                          letterSpacing: 0.2,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Birth/Death dates
                      if (person.birthDate != null || person.deathDate != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _formatDates(),
                            style: TextStyle(
                              fontSize: 11,
                              color: primaryColor.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDates() {
    final birthYear = person.birthDate?.year.toString() ?? '?';
    if (person.deathDate != null) {
      final deathYear = person.deathDate!.year.toString();
      return '$birthYear - $deathYear';
    } else if (person.birthDate != null) {
      return 'b. $birthYear';
    }
    return '';
  }

  /// Build avatar image - handles both local assets and network images
  Widget _buildAvatarImage(String avatarUrl, Color primaryColor) {
    final isLocalAsset = avatarUrl.startsWith('assets/');

    if (isLocalAsset) {
      // Use local asset image
      return Image.asset(
        avatarUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackAvatar(primaryColor);
        },
      );
    } else {
      // Use network image (DiceBear)
      return Image.network(
        avatarUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor.withOpacity(0.2),
                  primaryColor.withOpacity(0.1),
                ],
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackAvatar(primaryColor);
        },
      );
    }
  }

  /// Build fallback avatar when image fails to load
  Widget _buildFallbackAvatar(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withOpacity(0.2),
            primaryColor.withOpacity(0.1),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          _getGenderIcon(),
          color: primaryColor,
          size: 32,
        ),
      ),
    );
  }
}
