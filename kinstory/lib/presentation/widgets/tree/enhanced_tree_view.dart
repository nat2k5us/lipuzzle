import 'package:flutter/material.dart';
import '../../../data/datasources/local/mock_database.dart';

/// Enhanced tree view with zoom controls, orientation toggle, and collapsible nodes
class EnhancedTreeView extends StatefulWidget {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final bool isInverted;
  final Color primaryColor;
  final Color secondaryColor;

  const EnhancedTreeView({
    Key? key,
    required this.persons,
    required this.relationships,
    this.isInverted = false,
    this.primaryColor = Colors.teal,
    this.secondaryColor = Colors.purple,
  }) : super(key: key);

  @override
  State<EnhancedTreeView> createState() => _EnhancedTreeViewState();
}

class _EnhancedTreeViewState extends State<EnhancedTreeView> {
  final TransformationController _transformationController = TransformationController();
  bool _isHorizontal = false; // false = vertical, true = horizontal
  final Set<String> _collapsedNodes = {}; // Set of collapsed person IDs
  double _currentScale = 1.0;

  @override
  void initState() {
    super.initState();
    // Auto-fit the tree after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitTreeToView();
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _fitTreeToView() {
    // Calculate scale to fit entire tree
    final layout = _EnhancedTreeLayout(
      persons: widget.persons,
      relationships: widget.relationships,
      isInverted: widget.isInverted,
      isHorizontal: _isHorizontal,
      collapsedNodes: _collapsedNodes,
    );

    final screenSize = MediaQuery.of(context).size;
    final treeSize = layout.canvasSize;

    // Calculate scale to fit with some padding
    final scaleX = (screenSize.width - 100) / treeSize.width;
    final scaleY = (screenSize.height - 200) / treeSize.height;
    final scale = (scaleX < scaleY ? scaleX : scaleY).clamp(0.1, 3.0);

    setState(() {
      _currentScale = scale;
      _transformationController.value = Matrix4.identity()..scale(scale);
    });
  }

  void _zoomIn() {
    setState(() {
      _currentScale = (_currentScale * 1.2).clamp(0.3, 3.0);
      _transformationController.value = Matrix4.identity()..scale(_currentScale);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentScale = (_currentScale / 1.2).clamp(0.3, 3.0);
      _transformationController.value = Matrix4.identity()..scale(_currentScale);
    });
  }

  void _resetZoom() {
    _fitTreeToView();
  }

  void _toggleOrientation() {
    setState(() {
      _isHorizontal = !_isHorizontal;
    });
    // Re-fit after orientation change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitTreeToView();
    });
  }

  void _toggleNodeCollapse(String personId) {
    setState(() {
      if (_collapsedNodes.contains(personId)) {
        _collapsedNodes.remove(personId);
      } else {
        _collapsedNodes.add(personId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layout = _EnhancedTreeLayout(
      persons: widget.persons,
      relationships: widget.relationships,
      isInverted: widget.isInverted,
      isHorizontal: _isHorizontal,
      collapsedNodes: _collapsedNodes,
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
      child: Stack(
        children: [
          // Main tree view
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: const EdgeInsets.all(200),
              minScale: 0.1,
              maxScale: 3.0,
              onInteractionUpdate: (details) {
                setState(() {
                  _currentScale = _transformationController.value.getMaxScaleOnAxis();
                });
              },
              child: CustomPaint(
                painter: _TreeConnectionPainter(
                  positions: layout.positions,
                  relationships: widget.relationships,
                  persons: widget.persons,
                  nodeWidth: 100,
                  nodeHeight: 90,
                  isInverted: widget.isInverted,
                  isHorizontal: _isHorizontal,
                  collapsedNodes: _collapsedNodes,
                  primaryColor: widget.primaryColor,
                ),
                child: SizedBox(
                  width: layout.canvasSize.width,
                  height: layout.canvasSize.height,
                  child: Stack(
                    children: [
                      // Generation labels
                      for (final gen in layout.sortedGenerations)
                        if (_isHorizontal)
                          Positioned(
                            left: layout.rowOffsets[gen]! + 35,
                            top: 8,
                            child: _buildGenerationLabel(gen),
                          )
                        else
                          Positioned(
                            left: 8,
                            top: layout.rowOffsets[gen]! + 35,
                            child: _buildGenerationLabel(gen),
                          ),
                      // Person nodes
                      for (final person in layout.visiblePersons)
                        if (layout.positions.containsKey(person.id))
                          Positioned(
                            left: layout.positions[person.id]!.dx,
                            top: layout.positions[person.id]!.dy,
                            child: _buildPersonNode(person, layout),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Control panel overlay
          Positioned(
            top: 16,
            right: 16,
            child: _buildControlPanel(),
          ),
          // Zoom level indicator
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${(_currentScale * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlPanel() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Zoom in
          IconButton(
            icon: const Icon(Icons.add, size: 20),
            onPressed: _zoomIn,
            tooltip: 'Zoom In',
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
          ),
          const Divider(height: 1),
          // Zoom out
          IconButton(
            icon: const Icon(Icons.remove, size: 20),
            onPressed: _zoomOut,
            tooltip: 'Zoom Out',
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
          ),
          const Divider(height: 1),
          // Reset zoom (fit to view)
          IconButton(
            icon: const Icon(Icons.fit_screen, size: 20),
            onPressed: _resetZoom,
            tooltip: 'Fit to View',
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
          ),
          const Divider(height: 1),
          // Toggle orientation
          IconButton(
            icon: Icon(
              _isHorizontal ? Icons.swap_vert : Icons.swap_horiz,
              size: 20,
            ),
            onPressed: _toggleOrientation,
            tooltip: _isHorizontal ? 'Vertical Layout' : 'Horizontal Layout',
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerationLabel(int gen) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: widget.primaryColor.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: widget.primaryColor.shade200),
      ),
      child: Text(
        'Gen $gen',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: widget.primaryColor,
        ),
      ),
    );
  }

  Widget _buildPersonNode(MockPerson person, _EnhancedTreeLayout layout) {
    final hasChildren = layout.childrenMap[person.id]?.isNotEmpty ?? false;
    final isCollapsed = _collapsedNodes.contains(person.id);
    final primaryColor = person.gender == 'male'
        ? const Color(0xFF2196F3)
        : const Color(0xFFE91E63);

    return GestureDetector(
      onTap: hasChildren
          ? () => _toggleNodeCollapse(person.id)
          : null,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _CompactTreeNode(
            person: person,
            primaryColor: primaryColor,
          ),
          // Collapse/expand indicator
          if (hasChildren)
            Positioned(
              right: -8,
              top: -8,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  isCollapsed ? Icons.add : Icons.remove,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Compact tree node for the enhanced view
class _CompactTreeNode extends StatelessWidget {
  final MockPerson person;
  final Color primaryColor;

  const _CompactTreeNode({
    required this.person,
    required this.primaryColor,
  });

  IconData _getGenderIcon() {
    if (person.gender == 'male') return Icons.male;
    if (person.gender == 'female') return Icons.female;
    return Icons.person;
  }

  @override
  Widget build(BuildContext context) {
    final displayName = person.lastName != null
        ? '${person.firstName} ${person.lastName}'
        : person.firstName;

    return Container(
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
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor.withOpacity(0.3),
                width: 1.5,
              ),
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.2),
                  primaryColor.withOpacity(0.1),
                ],
              ),
            ),
            child: Icon(
              _getGenderIcon(),
              color: primaryColor,
              size: 18,
            ),
          ),
          const SizedBox(height: 3),
          // Name
          Flexible(
            child: Text(
              displayName,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
                height: 1.1,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Enhanced tree layout with horizontal/vertical support and collapse
class _EnhancedTreeLayout {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final bool isInverted;
  final bool isHorizontal;
  final Set<String> collapsedNodes;

  late final Map<String, Offset> positions;
  late final Map<int, List<MockPerson>> generationMap;
  late final List<int> sortedGenerations;
  late final Size canvasSize;
  late final Map<int, double> rowOffsets;
  late final Map<String, List<String>> childrenMap; // Parent -> Children
  late final List<MockPerson> visiblePersons;

  static const double _nodeWidth = 100;
  static const double _nodeHeight = 90;
  static const double _horizontalSpacing = 20;
  static const double _verticalSpacing = 50;

  _EnhancedTreeLayout({
    required this.persons,
    required this.relationships,
    required this.isInverted,
    required this.isHorizontal,
    required this.collapsedNodes,
  }) {
    positions = {};
    generationMap = {};
    sortedGenerations = [];
    rowOffsets = {};
    childrenMap = {};
    visiblePersons = [];
    _compute();
  }

  void _compute() {
    // Build children map
    _buildChildrenMap();

    // Calculate generations
    final generations = _calculateGenerations();

    // Group by generation
    for (final person in persons) {
      final gen = generations[person.id] ?? 0;
      generationMap.putIfAbsent(gen, () => []).add(person);
    }

    sortedGenerations
      ..clear()
      ..addAll(generationMap.keys.toList()..sort());

    if (isInverted) {
      sortedGenerations.sort((a, b) => b.compareTo(a));
    }

    // Filter visible persons (exclude collapsed descendants)
    _filterVisiblePersons();

    // Calculate positions based on orientation
    if (isHorizontal) {
      _calculateHorizontalPositions();
    } else {
      _calculateVerticalPositions();
    }
  }

  void _buildChildrenMap() {
    for (final rel in relationships) {
      if (rel.type == 'biological_parent' || rel.type == 'adoptive_parent') {
        childrenMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
      }
    }
  }

  void _filterVisiblePersons() {
    final hiddenPersons = <String>{};

    // Find all descendants of collapsed nodes
    void hideDescendants(String personId) {
      final children = childrenMap[personId] ?? [];
      for (final childId in children) {
        if (!hiddenPersons.contains(childId)) {
          hiddenPersons.add(childId);
          hideDescendants(childId); // Recursively hide
        }
      }
    }

    for (final collapsedId in collapsedNodes) {
      hideDescendants(collapsedId);
    }

    visiblePersons.clear();
    for (final person in persons) {
      if (!hiddenPersons.contains(person.id)) {
        visiblePersons.add(person);
      }
    }
  }

  void _calculateVerticalPositions() {
    final maxNodes = generationMap.values
        .fold<int>(0, (prev, list) => list.length > prev ? list.length : prev);

    final width = (maxNodes * (_nodeWidth + _horizontalSpacing)) + _horizontalSpacing * 2;
    final height = (sortedGenerations.length * (_nodeHeight + _verticalSpacing)) + _verticalSpacing * 2;
    canvasSize = Size(width, height);

    double currentY = _verticalSpacing;

    for (final gen in sortedGenerations) {
      final row = generationMap[gen]!.where((p) => visiblePersons.contains(p)).toList();
      if (row.isEmpty) continue;

      final rowWidth = row.length * _nodeWidth + (row.length - 1) * _horizontalSpacing;
      final startX = (width - rowWidth) / 2;
      rowOffsets[gen] = currentY;

      for (var i = 0; i < row.length; i++) {
        final person = row[i];
        final x = startX + i * (_nodeWidth + _horizontalSpacing);
        positions[person.id] = Offset(x, currentY);
      }

      currentY += _nodeHeight + _verticalSpacing;
    }
  }

  void _calculateHorizontalPositions() {
    final maxNodes = generationMap.values
        .fold<int>(0, (prev, list) => list.length > prev ? list.length : prev);

    final width = (sortedGenerations.length * (_nodeWidth + _horizontalSpacing)) + _horizontalSpacing * 2;
    final height = (maxNodes * (_nodeHeight + _verticalSpacing)) + _verticalSpacing * 2;
    canvasSize = Size(width, height);

    double currentX = _horizontalSpacing;

    for (final gen in sortedGenerations) {
      final row = generationMap[gen]!.where((p) => visiblePersons.contains(p)).toList();
      if (row.isEmpty) continue;

      final rowHeight = row.length * _nodeHeight + (row.length - 1) * _verticalSpacing;
      final startY = (height - rowHeight) / 2;
      rowOffsets[gen] = currentX;

      for (var i = 0; i < row.length; i++) {
        final person = row[i];
        final y = startY + i * (_nodeHeight + _verticalSpacing);
        positions[person.id] = Offset(currentX, y);
      }

      currentX += _nodeWidth + _horizontalSpacing;
    }
  }

  Map<String, int> _calculateGenerations() {
    final generations = <String, int>{};
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};

    for (final rel in relationships) {
      if (rel.type == 'biological_parent' || rel.type == 'adoptive_parent') {
        parentChildMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
        childParentMap.putIfAbsent(rel.person2Id, () => []).add(rel.person1Id);
      }
    }

    // Extract custom generations if present
    for (final person in persons) {
      final gen = person.customFields['generation'];
      if (gen is int) {
        generations[person.id] = gen;
      }
    }

    // Find roots
    final roots = persons.where((p) =>
        !childParentMap.containsKey(p.id) || childParentMap[p.id]!.isEmpty
    ).toList();

    // BFS from roots
    final visited = <String>{};
    final queue = <MapEntry<String, int>>[];

    for (final root in roots) {
      if (!visited.contains(root.id)) {
        queue.add(MapEntry(root.id, generations[root.id] ?? 0));
        visited.add(root.id);
      }
    }

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      final currentGen = current.value;
      final children = parentChildMap[current.key] ?? [];

      for (final childId in children) {
        if (!visited.contains(childId)) {
          generations[childId] = generations[childId] ?? currentGen + 1;
          visited.add(childId);
          queue.add(MapEntry(childId, generations[childId]!));
        }
      }
    }

    for (final person in persons) {
      generations.putIfAbsent(person.id, () => 0);
    }

    return generations;
  }
}

/// Custom painter for tree connections
class _TreeConnectionPainter extends CustomPainter {
  final Map<String, Offset> positions;
  final List<MockRelationship> relationships;
  final List<MockPerson> persons;
  final double nodeWidth;
  final double nodeHeight;
  final bool isInverted;
  final bool isHorizontal;
  final Set<String> collapsedNodes;
  final Color primaryColor;

  _TreeConnectionPainter({
    required this.positions,
    required this.relationships,
    required this.persons,
    required this.nodeWidth,
    required this.nodeHeight,
    required this.isInverted,
    required this.isHorizontal,
    required this.collapsedNodes,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (final rel in relationships) {
      if (rel.type != 'biological_parent' && rel.type != 'adoptive_parent') continue;

      // Skip if child's parent is collapsed
      if (collapsedNodes.contains(rel.person1Id)) continue;

      final parentPos = positions[rel.person1Id];
      final childPos = positions[rel.person2Id];
      if (parentPos == null || childPos == null) continue;

      if (isHorizontal) {
        _drawHorizontalConnection(canvas, paint, parentPos, childPos);
      } else {
        _drawVerticalConnection(canvas, paint, parentPos, childPos);
      }
    }
  }

  void _drawVerticalConnection(Canvas canvas, Paint paint, Offset parentPos, Offset childPos) {
    final parentCenter = Offset(
      parentPos.dx + nodeWidth / 2,
      isInverted ? parentPos.dy : parentPos.dy + nodeHeight,
    );
    final childCenter = Offset(
      childPos.dx + nodeWidth / 2,
      isInverted ? childPos.dy + nodeHeight : childPos.dy,
    );

    final midY = (parentCenter.dy + childCenter.dy) / 2;

    final path = Path()
      ..moveTo(parentCenter.dx, parentCenter.dy)
      ..lineTo(parentCenter.dx, midY)
      ..lineTo(childCenter.dx, midY)
      ..lineTo(childCenter.dx, childCenter.dy);

    canvas.drawPath(path, paint);
  }

  void _drawHorizontalConnection(Canvas canvas, Paint paint, Offset parentPos, Offset childPos) {
    final parentCenter = Offset(
      parentPos.dx + nodeWidth,
      parentPos.dy + nodeHeight / 2,
    );
    final childCenter = Offset(
      childPos.dx,
      childPos.dy + nodeHeight / 2,
    );

    final midX = (parentCenter.dx + childCenter.dx) / 2;

    final path = Path()
      ..moveTo(parentCenter.dx, parentCenter.dy)
      ..lineTo(midX, parentCenter.dy)
      ..lineTo(midX, childCenter.dy)
      ..lineTo(childCenter.dx, childCenter.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
