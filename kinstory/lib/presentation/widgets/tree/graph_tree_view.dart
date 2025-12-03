import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import '../../../data/datasources/local/mock_database.dart';
import 'person_node_widget.dart';

enum GraphAlgorithm {
  sugiyama,
  fruchtermanReingold,
  buchheimWalker,
}

/// A family tree view that uses the GraphView package to render
/// a hierarchical graph of family relationships.
class GraphTreeView extends StatefulWidget {
  final List<MockPerson> persons;
  final List<MockRelationship> relationships;
  final Function(MockPerson)? onPersonTap;
  final String? rootPersonId;

  const GraphTreeView({
    Key? key,
    required this.persons,
    required this.relationships,
    this.onPersonTap,
    this.rootPersonId,
  }) : super(key: key);

  @override
  State<GraphTreeView> createState() => _GraphTreeViewState();
}

class _GraphTreeViewState extends State<GraphTreeView> {
  late Graph graph;
  late BuchheimWalkerConfiguration builder;
  late TransformationController transformationController;
  GraphAlgorithm _selectedAlgorithm = GraphAlgorithm.sugiyama;

  @override
  void initState() {
    super.initState();
    transformationController = TransformationController();
    _initializeGraph();
  }

  @override
  void didUpdateWidget(GraphTreeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.persons != widget.persons ||
        oldWidget.relationships != widget.relationships) {
      _initializeGraph();
    }
  }

  @override
  void dispose() {
    transformationController.dispose();
    super.dispose();
  }

  void _initializeGraph() {
    graph = Graph()..isTree = true;
    builder = BuchheimWalkerConfiguration();

    // Configure the layout algorithm for better spacing
    builder
      ..siblingSeparation = 120
      ..levelSeparation = 150
      ..subtreeSeparation = 180
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

    _buildGraph();
  }

  void _buildGraph() {
    // Create a map of person ID to Node
    final Map<String, Node> nodeMap = {};

    print('🔵 GraphView: Building graph with ${widget.persons.length} persons and ${widget.relationships.length} relationships');

    // Create nodes for all persons
    for (var person in widget.persons) {
      final node = Node.Id(person.id);
      nodeMap[person.id] = node;
      graph.addNode(node);
    }

    print('🔵 GraphView: Created ${nodeMap.length} nodes');

    // Create edges based on relationships
    // We'll create parent-child edges to form the tree structure
    int edgeCount = 0;
    for (var relationship in widget.relationships) {
      final node1 = nodeMap[relationship.person1Id];
      final node2 = nodeMap[relationship.person2Id];

      if (node1 == null || node2 == null) {
        print('⚠️ GraphView: Skipping relationship - missing node for ${relationship.person1Id} or ${relationship.person2Id}');
        continue;
      }

      // Create edges for parent-child relationships
      if (_isParentChildRelationship(relationship.type)) {
        // Determine which is parent and which is child
        if (_isParentType(relationship.type)) {
          // person1 is parent, person2 is child
          graph.addEdge(node1, node2);
          edgeCount++;
          print('🔵 GraphView: Added edge ${relationship.person1Id} -> ${relationship.person2Id} (${relationship.type})');
        } else {
          // person1 is child, person2 is parent
          graph.addEdge(node2, node1);
          edgeCount++;
          print('🔵 GraphView: Added edge ${relationship.person2Id} -> ${relationship.person1Id} (${relationship.type})');
        }
      }
      // For spouse/partner relationships, we could handle them differently
      // by creating horizontal connections, but for simplicity we'll skip
      // them in the tree structure for now
    }

    print('🔵 GraphView: Created $edgeCount edges');
  }

  bool _isParentChildRelationship(String type) {
    return type.contains('parent') || type.contains('child');
  }

  bool _isParentType(String type) {
    return type.contains('parent');
  }

  void _resetZoom() {
    setState(() {
      transformationController.value = Matrix4.identity();
    });
  }

  void _zoomToFit() {
    setState(() {
      // Zoom out significantly to show the entire tree
      final Matrix4 matrix = Matrix4.identity();
      matrix.scale(0.15); // Zoom out to 15% to show everything
      transformationController.value = matrix;
    });
  }

  void _switchAlgorithm(GraphAlgorithm algorithm) {
    setState(() {
      _selectedAlgorithm = algorithm;
    });
  }

  Algorithm _getAlgorithm() {
    switch (_selectedAlgorithm) {
      case GraphAlgorithm.sugiyama:
        return SugiyamaAlgorithm(SugiyamaConfiguration());
      case GraphAlgorithm.fruchtermanReingold:
        return FruchtermanReingoldAlgorithm(FruchtermanReingoldConfiguration());
      case GraphAlgorithm.buchheimWalker:
        return BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder));
    }
  }

  String _getAlgorithmName() {
    switch (_selectedAlgorithm) {
      case GraphAlgorithm.sugiyama:
        return 'Sugiyama (Layered)';
      case GraphAlgorithm.fruchtermanReingold:
        return 'Force-Directed';
      case GraphAlgorithm.buchheimWalker:
        return 'Tree (Hierarchical)';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.persons.isEmpty) {
      return const Center(
        child: Text('No persons to display'),
      );
    }

    return Stack(
      children: [
        InteractiveViewer(
          transformationController: transformationController,
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 10.0,
          child: GraphView(
            graph: graph,
            algorithm: _getAlgorithm(),
            paint: Paint()
              ..color = const Color(0xFF90A4AE) // Professional grey-blue
              ..strokeWidth = 2.5
              ..strokeCap = StrokeCap.round
              ..style = PaintingStyle.stroke,
            builder: (Node node) {
              // Find the person for this node
              final personId = node.key?.value as String;
              final person = widget.persons.firstWhere(
                (p) => p.id == personId,
                orElse: () => throw Exception('Person not found: $personId'),
              );

              return PersonNodeWidget(
                person: person,
                onTap: widget.onPersonTap != null
                    ? () => widget.onPersonTap!(person)
                    : null,
              );
            },
          ),
        ),
        // Algorithm Switcher - Top Left
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5E35B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.account_tree,
                          size: 16,
                          color: Color(0xFF5E35B1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Layout',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildAlgorithmOption(
                    GraphAlgorithm.sugiyama,
                    'Sugiyama',
                    'Layered layout',
                    Icons.layers,
                  ),
                  _buildAlgorithmOption(
                    GraphAlgorithm.fruchtermanReingold,
                    'Force-Directed',
                    'Physics-based',
                    Icons.scatter_plot,
                  ),
                  _buildAlgorithmOption(
                    GraphAlgorithm.buchheimWalker,
                    'Tree',
                    'Hierarchical',
                    Icons.account_tree,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Zoom Controls - Top Right
        Positioned(
          top: 16,
          right: 16,
          child: Column(
            children: [
              FloatingActionButton(
                mini: true,
                heroTag: 'zoom_in',
                onPressed: () {
                  setState(() {
                    final current = transformationController.value;
                    transformationController.value = current.clone()
                      ..scale(1.2);
                  });
                },
                tooltip: 'Zoom In',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                mini: true,
                heroTag: 'zoom_out',
                onPressed: () {
                  setState(() {
                    final current = transformationController.value;
                    transformationController.value = current.clone()
                      ..scale(0.8);
                  });
                },
                tooltip: 'Zoom Out',
                child: const Icon(Icons.remove),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                mini: true,
                heroTag: 'fit_all',
                backgroundColor: const Color(0xFF5E35B1),
                onPressed: _zoomToFit,
                tooltip: 'Fit All',
                child: const Icon(Icons.fit_screen),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                mini: true,
                heroTag: 'reset_zoom',
                onPressed: _resetZoom,
                tooltip: 'Reset Zoom',
                child: const Icon(Icons.zoom_out_map),
              ),
            ],
          ),
        ),
        // Instructions
        Positioned(
          bottom: 16,
          left: 16,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 20,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Pinch to zoom • Drag to pan • Tap node for details',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlgorithmOption(
    GraphAlgorithm algorithm,
    String name,
    String description,
    IconData icon,
  ) {
    final isSelected = _selectedAlgorithm == algorithm;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () => _switchAlgorithm(algorithm),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF5E35B1).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF5E35B1)
                  : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? const Color(0xFF5E35B1)
                    : Colors.grey.shade600,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? const Color(0xFF5E35B1)
                          : const Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey.shade600,
                    ),
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
