import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// Temporarily use dynamic types until we fix the domain entities
// import '../../../domain/entities/person.dart';
// import '../../../domain/entities/relationship.dart';
// import '../../../domain/services/generation_calculator.dart';

/// A hierarchical tree visualization widget that displays family members
/// in a top-down structure with clear generation levels
class HierarchicalTreeView extends ConsumerStatefulWidget {
  final String treeId;
  final List<dynamic> persons; // Will be MockPerson for now
  final List<dynamic> relationships; // Will be MockRelationship for now

  const HierarchicalTreeView({
    super.key,
    required this.treeId,
    required this.persons,
    required this.relationships,
  });

  @override
  ConsumerState<HierarchicalTreeView> createState() => _HierarchicalTreeViewState();
}

class _HierarchicalTreeViewState extends ConsumerState<HierarchicalTreeView>
    with SingleTickerProviderStateMixin {
  late Map<String, int> _generations;
  late Map<int, List<dynamic>> _personsByGeneration; // Using dynamic for MockPerson
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  late AnimationController _animationController;

  // Layout constants
  static const double nodeWidth = 200.0;
  static const double nodeHeight = 80.0;
  static const double horizontalSpacing = 40.0;
  static const double verticalSpacing = 120.0;
  static const double padding = 50.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _calculateGenerations();
  }

  @override
  void didUpdateWidget(HierarchicalTreeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.persons != widget.persons ||
        oldWidget.relationships != widget.relationships) {
      _calculateGenerations();
    }
  }

  void _calculateGenerations() {
    // Simple generation calculation for mock data
    _generations = {};
    _personsByGeneration = {};

    // Build parent-child map from relationships
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};

    for (final rel in widget.relationships) {
      if (rel.type == 'biological_parent' || rel.type == 'adoptive_parent') {
        parentChildMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
        childParentMap.putIfAbsent(rel.person2Id, () => []).add(rel.person1Id);
      }
    }

    // Respect custom generation metadata when available
    for (final person in widget.persons) {
      final customGen = _extractCustomGeneration(person);
      if (customGen != null) {
        _generations[person.id] = customGen;
      }
    }
    debugPrint('Custom generations loaded: ${_generations.length}');

    // Find root person (Krishna or person with no parents)
    dynamic rootPerson;
    for (final person in widget.persons) {
      if (!childParentMap.containsKey(person.id)) {
        final fullName =
            '${person.firstName} ${person.lastName ?? ''}'.toLowerCase();
        if (fullName.contains('krishna') || fullName.contains('kṛṣṇa')) {
          rootPerson = person;
          break;
        }
        rootPerson ??= person;
      }
    }

    // If we found a root, calculate generations from there
    if (rootPerson != null) {
      final visited = <String>{};
      final queue = <MapEntry<String, int>>[];

      queue.add(MapEntry(rootPerson.id, 0));
      _generations[rootPerson.id] = _generations[rootPerson.id] ?? 0;
      visited.add(rootPerson.id);

      while (queue.isNotEmpty) {
        final current = queue.removeAt(0);
        final currentId = current.key;
        final currentGen = current.value;

        // Process children
        final children = parentChildMap[currentId] ?? [];
        for (final childId in children) {
          if (!visited.contains(childId)) {
            _generations[childId] =
                _generations[childId] ?? currentGen + 1;
            queue.add(MapEntry(childId, currentGen + 1));
            visited.add(childId);
          }
        }
      }
    }

    // Assign default generation to unvisited persons
    for (final person in widget.persons) {
      _generations.putIfAbsent(person.id, () => 0);
    }

    // Group persons by generation
    for (final person in widget.persons) {
      final generation = _generations[person.id] ?? 0;
      _personsByGeneration.putIfAbsent(generation, () => []).add(person);
    }

    // Sort each generation by importance and name
    for (final persons in _personsByGeneration.values) {
      persons.sort((a, b) {
        // Krishna and important figures first
        if (_isImportantPerson(a) && !_isImportantPerson(b)) return -1;
        if (!_isImportantPerson(a) && _isImportantPerson(b)) return 1;
        return a.firstName.compareTo(b.firstName);
      });
    }
  }

  bool _isImportantPerson(dynamic person) {
    final fullName =
        '${person.firstName} ${person.lastName ?? ''}'.toLowerCase();
    return fullName.contains('krishna') ||
           fullName.contains('kṛṣṇa') ||
           fullName.contains('brahma') ||
           fullName.contains('brahmā') ||
           fullName.contains('rama') ||
           fullName.contains('rāma') ||
           fullName.contains('manu') ||
           fullName.contains('arjuna') ||
           fullName.contains('yudhishthira');
  }

  int? _extractCustomGeneration(dynamic person) {
    final fields = person.customFields;
    if (fields == null) return null;
    final value = fields['generation'];
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.persons.isEmpty) {
      return const Center(
        child: Text(
          'No family members to display',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final treeSize = _calculateTreeSize();
    final widgetHeight = treeSize.height.isFinite
        ? treeSize.height.clamp(400.0, 1200.0)
        : 600.0;

    return SizedBox(
      width: double.infinity,
      height: widgetHeight,
      child: ExcludeSemantics(
      child: GestureDetector(
        onScaleUpdate: (details) {
          setState(() {
            _scale = (_scale * details.scale).clamp(0.5, 3.0);
            if (details.scale != 1.0) {
              _offset = _offset + (details.localFocalPoint - details.focalPoint) * (1 - details.scale);
            }
          });
        },
        onScaleEnd: (_) {
          _animationController.forward(from: 0).then((_) {
            if (mounted) {
              setState(() {
                // Snap to nice scale values
                if (_scale < 0.8) _scale = 0.75;
                else if (_scale < 1.2) _scale = 1.0;
                else if (_scale < 1.7) _scale = 1.5;
                else if (_scale < 2.2) _scale = 2.0;
              });
            }
          });
        },
        child: ClipRect(
          child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(200),
          minScale: 0.5,
          maxScale: 3.0,
          scaleEnabled: true,
          panEnabled: true,
          child: CustomPaint(
            size: treeSize,
            painter: _TreePainter(
              personsByGeneration: _personsByGeneration,
              relationships: widget.relationships,
              personsMap: {for (var p in widget.persons) p.id: p},
              onTapPerson: (person) {
                context.go('/dashboard/person/${person.id}');
              },
            ),
            child: _buildInteractiveNodes(),
          ),
        ),
      ),
    ),
    ),
    );
  }

  Size _calculateTreeSize() {
    if (_personsByGeneration.isEmpty) return const Size(100, 100);

    final maxWidth = _personsByGeneration.values
        .map((persons) => persons.length * (nodeWidth + horizontalSpacing))
        .reduce((a, b) => a > b ? a : b);

    final height = _personsByGeneration.length * (nodeHeight + verticalSpacing);

    return Size(
      maxWidth + padding * 2,
      height + padding * 2,
    );
  }

  Widget _buildInteractiveNodes() {
    return Stack(
      children: [
        for (final entry in _personsByGeneration.entries)
          ..._buildGenerationNodes(entry.key, entry.value),
      ],
    );
  }

  List<Widget> _buildGenerationNodes(int generation, List<dynamic> persons) {
    final widgets = <Widget>[];
    final y = padding + generation * (nodeHeight + verticalSpacing);

    // Calculate total width needed for this generation
    final totalWidth = persons.length * nodeWidth +
                      (persons.length - 1) * horizontalSpacing;

    // Center the generation horizontally
    final treeWidth = _calculateTreeSize().width;
    final startX = (treeWidth - totalWidth) / 2;

    for (int i = 0; i < persons.length; i++) {
      final person = persons[i];
      final x = startX + i * (nodeWidth + horizontalSpacing);

      widgets.add(
        Positioned(
          left: x,
          top: y,
          width: nodeWidth,
          height: nodeHeight,
          child: _PersonNode(
            person: person,
            isImportant: _isImportantPerson(person),
            generation: generation,
            onTap: () => context.go('/dashboard/person/${person.id}'),
          ),
        ),
      );
    }

    // Add generation label
    widgets.add(
      Positioned(
        left: 10,
        top: y + nodeHeight / 2 - 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Gen $generation',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );

    return widgets;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _PersonNode extends StatefulWidget {
  final dynamic person; // Will be MockPerson for now
  final bool isImportant;
  final int generation;
  final VoidCallback onTap;

  const _PersonNode({
    required this.person,
    required this.isImportant,
    required this.generation,
    required this.onTap,
  });

  @override
  State<_PersonNode> createState() => _PersonNodeState();
}

class _PersonNodeState extends State<_PersonNode> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          child: Container(
            decoration: BoxDecoration(
              color: widget.isImportant
                ? const Color(0xFFFFF8E6)  // Light gold for important persons
                : Colors.white,
              borderRadius: BorderRadius.circular(widget.isImportant ? 16 : 12),
              border: Border.all(
                color: widget.isImportant
                  ? const Color(0xFFAA7722)  // Gold border
                  : Colors.grey.shade400,
                width: widget.isImportant ? 2 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: (_isHovered ? Colors.teal : Colors.grey).withOpacity(0.3),
                  blurRadius: _isHovered ? 12 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.person.firstName,
                  style: TextStyle(
                    fontSize: widget.isImportant ? 16 : 14,
                    fontWeight: widget.isImportant ? FontWeight.bold : FontWeight.w600,
                    color: widget.isImportant ? const Color(0xFFAA7722) : Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (widget.person.lastName != null && widget.person.lastName!.isNotEmpty)
                  Text(
                    widget.person.lastName!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 2),
                if (widget.generation == 0)
                  const Text(
                    'Supreme',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TreePainter extends CustomPainter {
  final Map<int, List<dynamic>> personsByGeneration; // Using dynamic for MockPerson
  final List<dynamic> relationships; // Using dynamic for MockRelationship
  final Map<String, dynamic> personsMap; // Using dynamic for MockPerson
  final void Function(dynamic) onTapPerson;

  _TreePainter({
    required this.personsByGeneration,
    required this.relationships,
    required this.personsMap,
    required this.onTapPerson,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Draw relationships as lines
    for (final relationship in relationships) {
      if (_isParentChildRelationship(relationship.type)) {
        final parent = personsMap[relationship.person1Id];
        final child = personsMap[relationship.person2Id];

        if (parent != null && child != null) {
          final parentPos = _getPersonPosition(parent);
          final childPos = _getPersonPosition(child);

          if (parentPos != null && childPos != null) {
            // Draw curved line from parent to child
            final path = Path();
            path.moveTo(parentPos.dx, parentPos.dy + 80);

            final controlPoint1 = Offset(
              parentPos.dx,
              parentPos.dy + 80 + 30,
            );
            final controlPoint2 = Offset(
              childPos.dx,
              childPos.dy - 30,
            );

            path.cubicTo(
              controlPoint1.dx, controlPoint1.dy,
              controlPoint2.dx, controlPoint2.dy,
              childPos.dx, childPos.dy,
            );

            canvas.drawPath(path, paint);
          }
        }
      }
    }
  }

  bool _isParentChildRelationship(String type) {
    return type == 'biological_parent' ||
           type == 'adoptive_parent' ||
           type == 'foster_parent';
  }

  Offset? _getPersonPosition(dynamic person) {
    // Find which generation this person belongs to
    for (final entry in personsByGeneration.entries) {
      final generation = entry.key;
      final persons = entry.value;
      final index = persons.indexOf(person);

      if (index != -1) {
        final y = 50.0 + generation * 200.0;
        final totalWidth = persons.length * 240.0;
        final startX = 1200.0 - totalWidth / 2;  // Center based on typical screen width
        final x = startX + index * 240.0 + 100.0;  // Center of node

        return Offset(x, y);
      }
    }
    return null;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
