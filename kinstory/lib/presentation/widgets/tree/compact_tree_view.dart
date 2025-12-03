import 'package:flutter/material.dart';
import '../../../data/datasources/local/mock_database.dart';

/// Compact tree node widget - small, efficient design for displaying many characters
class CompactTreeNode extends StatelessWidget {
  final MockPerson person;
  final VoidCallback? onTap;
  final bool showAvatar;

  const CompactTreeNode({
    Key? key,
    required this.person,
    this.onTap,
    this.showAvatar = true,
  }) : super(key: key);

  Color _getPrimaryColor() {
    if (person.gender == 'male') {
      return const Color(0xFF2196F3);
    } else if (person.gender == 'female') {
      return const Color(0xFFE91E63);
    } else {
      return const Color(0xFF9E9E9E);
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
    final displayName = person.lastName != null
        ? '${person.firstName} ${person.lastName}'
        : person.firstName;
    final isDeceased = person.deathDate != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        constraints: const BoxConstraints(minHeight: 90, maxHeight: 110),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primaryColor.withOpacity(0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Compact avatar
            if (showAvatar)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: person.avatarUrl != null
                      ? _buildAvatarImage(person.avatarUrl!, primaryColor)
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
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
                              size: 18,
                            ),
                          ),
                        ),
                ),
              ),
            const SizedBox(height: 3),
            // Name
            Flexible(
              child: Text(
                displayName,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212121),
                  decoration: isDeceased ? TextDecoration.lineThrough : null,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Birth year (compact)
            if (person.birthDate != null) ...[
              const SizedBox(height: 2),
              Text(
                person.deathDate != null
                    ? '${person.birthDate!.year}-${person.deathDate!.year}'
                    : 'b.${person.birthDate!.year}',
                style: TextStyle(
                  fontSize: 7,
                  color: primaryColor.withOpacity(0.7),
                  height: 1.0,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarImage(String avatarUrl, Color primaryColor) {
    final isLocalAsset = avatarUrl.startsWith('assets/');

    if (isLocalAsset) {
      return Image.asset(
        avatarUrl,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackAvatar(primaryColor);
        },
      );
    } else {
      return Image.network(
        avatarUrl,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.2),
                  primaryColor.withOpacity(0.1),
                ],
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
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

  Widget _buildFallbackAvatar(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
          size: 20,
        ),
      ),
    );
  }
}

/// Traditional tree view - roots at top, descendants below
class TraditionalTreeView extends StatelessWidget {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final Function(MockPerson)? onPersonTap;

  const TraditionalTreeView({
    Key? key,
    required this.persons,
    required this.relationships,
    this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = _CompactTreeLayout(
      persons: persons,
      relationships: relationships,
      isInverted: false,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.3,
          maxScale: 3,
          child: CustomPaint(
            painter: _TreeConnectionPainter(
              positions: layout.positions,
              relationships: relationships,
              persons: persons,
              nodeWidth: 100,
              nodeHeight: 90,
              isInverted: false,
            ),
            child: SizedBox(
              width: layout.canvasSize.width,
              height: layout.canvasSize.height,
              child: Stack(
                children: [
                  // Generation labels
                  for (final gen in layout.sortedGenerations)
                    Positioned(
                      left: 8,
                      top: layout.rowOffsets[gen]! + 35,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.teal.shade200),
                        ),
                        child: Text(
                          'Gen $gen',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  // Person nodes
                  for (final person in persons)
                    if (layout.positions.containsKey(person.id))
                      Positioned(
                        left: layout.positions[person.id]!.dx,
                        top: layout.positions[person.id]!.dy,
                        child: CompactTreeNode(
                          person: person,
                          onTap: onPersonTap != null
                              ? () => onPersonTap!(person)
                              : null,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Inverted tree view - roots at bottom, descendants above
class InvertedTreeView extends StatelessWidget {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final Function(MockPerson)? onPersonTap;

  const InvertedTreeView({
    Key? key,
    required this.persons,
    required this.relationships,
    this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = _CompactTreeLayout(
      persons: persons,
      relationships: relationships,
      isInverted: true,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.3,
          maxScale: 3,
          child: CustomPaint(
            painter: _TreeConnectionPainter(
              positions: layout.positions,
              relationships: relationships,
              persons: persons,
              nodeWidth: 100,
              nodeHeight: 90,
              isInverted: true,
            ),
            child: SizedBox(
              width: layout.canvasSize.width,
              height: layout.canvasSize.height,
              child: Stack(
                children: [
                  // Generation labels
                  for (final gen in layout.sortedGenerations)
                    Positioned(
                      left: 8,
                      top: layout.rowOffsets[gen]! + 35,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.purple.shade200),
                        ),
                        child: Text(
                          'Gen $gen',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                  // Person nodes
                  for (final person in persons)
                    if (layout.positions.containsKey(person.id))
                      Positioned(
                        left: layout.positions[person.id]!.dx,
                        top: layout.positions[person.id]!.dy,
                        child: CompactTreeNode(
                          person: person,
                          onTap: onPersonTap != null
                              ? () => onPersonTap!(person)
                              : null,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Layout calculator for compact tree views
class _CompactTreeLayout {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final bool isInverted;

  static const double _nodeWidth = 100;
  static const double _nodeHeight = 90;
  static const double _horizontalSpacing = 20;
  static const double _verticalSpacing = 50;

  late final Map<String, Offset> positions;
  late final Map<int, List<MockPerson>> generationMap;
  late final List<int> sortedGenerations;
  late final Size canvasSize;
  late final Map<int, double> rowOffsets;

  _CompactTreeLayout({
    required this.persons,
    required this.relationships,
    required this.isInverted,
  }) {
    positions = {};
    generationMap = {};
    sortedGenerations = [];
    rowOffsets = {};
    _compute();
  }

  void _compute() {
    final generations = _calculateGenerations();

    // Group persons by generation
    for (final person in persons) {
      final gen = generations[person.id] ?? 0;
      generationMap.putIfAbsent(gen, () => []).add(person);
    }

    sortedGenerations
      ..clear()
      ..addAll(generationMap.keys.toList()..sort());

    // Calculate canvas size
    final maxNodes = generationMap.values.fold<int>(
      0,
      (prev, list) => list.length > prev ? list.length : prev,
    );

    final width = (maxNodes * (_nodeWidth + _horizontalSpacing)) +
        _horizontalSpacing * 2 +
        80; // Extra space for labels

    final height = (sortedGenerations.length * (_nodeHeight + _verticalSpacing)) +
        _verticalSpacing * 2;

    canvasSize = Size(width, height);

    // Calculate positions
    final generationsToLayout = isInverted
        ? sortedGenerations.reversed.toList()
        : sortedGenerations;

    double currentY = _verticalSpacing;

    for (var i = 0; i < generationsToLayout.length; i++) {
      final gen = generationsToLayout[i];
      final row = generationMap[gen]!;

      final rowWidth = row.length * _nodeWidth +
          (row.length - 1) * _horizontalSpacing;
      final startX = (width - rowWidth) / 2;

      rowOffsets[gen] = currentY;

      for (var j = 0; j < row.length; j++) {
        final person = row[j];
        final x = startX + j * (_nodeWidth + _horizontalSpacing);
        positions[person.id] = Offset(x, currentY);
      }

      currentY += _nodeHeight + _verticalSpacing;
    }
  }

  Map<String, int> _calculateGenerations() {
    final generations = <String, int>{};
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};

    // Build relationship maps
    for (final rel in relationships) {
      final type = rel.type;
      if (type == 'biological_parent' || type == 'adoptive_parent') {
        parentChildMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
        childParentMap.putIfAbsent(rel.person2Id, () => []).add(rel.person1Id);
      }
    }

    // Extract custom generations from customFields
    for (final person in persons) {
      final gen = _extractCustomGeneration(person);
      if (gen != null) generations[person.id] = gen;
    }

    // Find root (Krishna or any person without parents)
    MockPerson? root;
    for (final person in persons) {
      if (!childParentMap.containsKey(person.id)) {
        final fullName = '${person.firstName} ${person.lastName ?? ''}'.toLowerCase();
        if (fullName.contains('krishna') || fullName.contains('kṛṣṇa')) {
          root = person;
          break;
        }
        root ??= person;
      }
    }

    // BFS to assign generations
    if (root != null) {
      final visited = <String>{};
      final queue = <MapEntry<String, int>>[];
      queue.add(MapEntry(root.id, generations[root.id] ?? 0));
      visited.add(root.id);

      while (queue.isNotEmpty) {
        final current = queue.removeAt(0);
        final currentId = current.key;
        final currentGen = current.value;
        final children = parentChildMap[currentId] ?? [];

        for (final child in children) {
          if (!visited.contains(child)) {
            generations[child] = generations[child] ?? currentGen + 1;
            visited.add(child);
            queue.add(MapEntry(child, generations[child]!));
          }
        }
      }
    }

    // Assign default generation to unassigned persons
    for (final person in persons) {
      generations.putIfAbsent(person.id, () => 0);
    }

    return generations;
  }

  int? _extractCustomGeneration(MockPerson person) {
    final fields = person.customFields;
    final value = fields['generation'];
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}

/// Custom painter for drawing tree connections
class _TreeConnectionPainter extends CustomPainter {
  final Map<String, Offset> positions;
  final List<MockRelationship> relationships;
  final List<MockPerson> persons;
  final double nodeWidth;
  final double nodeHeight;
  final bool isInverted;

  _TreeConnectionPainter({
    required this.positions,
    required this.relationships,
    required this.persons,
    required this.nodeWidth,
    required this.nodeHeight,
    required this.isInverted,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal.withOpacity(0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (final rel in relationships) {
      final type = rel.type;
      if (type != 'biological_parent' && type != 'adoptive_parent') continue;

      final parentPos = positions[rel.person1Id];
      final childPos = positions[rel.person2Id];
      if (parentPos == null || childPos == null) continue;

      // Calculate connection points
      final parentCenter = Offset(
        parentPos.dx + nodeWidth / 2,
        isInverted ? parentPos.dy : parentPos.dy + nodeHeight,
      );
      final childCenter = Offset(
        childPos.dx + nodeWidth / 2,
        isInverted ? childPos.dy + nodeHeight : childPos.dy,
      );

      // Draw L-shaped connection
      final midY = (parentCenter.dy + childCenter.dy) / 2;

      final path = Path()
        ..moveTo(parentCenter.dx, parentCenter.dy)
        ..lineTo(parentCenter.dx, midY)
        ..lineTo(childCenter.dx, midY)
        ..lineTo(childCenter.dx, childCenter.dy);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
