import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/tree_providers.dart';
import '../../providers/person_providers.dart';
import '../../widgets/tree/enhanced_tree_view.dart';
import '../../../data/datasources/local/mock_database.dart';

class TreeDetailScreen extends ConsumerWidget {
  final String treeId;

  const TreeDetailScreen({
    super.key,
    required this.treeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeAsync = ref.watch(treeProvider(treeId));
    final personsAsync = ref.watch(personsProvider);
    final relationshipsAsync = ref.watch(treeRelationshipsProvider(treeId));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: treeAsync.when(
            data: (tree) => Text(
              tree?.name ?? 'Family Tree',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            loading: () => const Text('Loading...'),
            error: (_, __) => const Text('Error'),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.teal),
            onPressed: () => context.go('/dashboard/trees'),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_add, color: Colors.teal),
              onPressed: () => context.go('/dashboard/person/new'),
            ),
            IconButton(
              icon: const Icon(Icons.link, color: Colors.teal),
              onPressed: () => context.go('/dashboard/relationships/new?treeId=$treeId'),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.teal),
              onPressed: () {
                _showTreeOptions(context);
              },
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Tree View'),
              Tab(text: 'JSON View'),
              Tab(text: 'Inverted Tree'),
              Tab(text: 'Compact Tree'),
            ],
          ),
        ),
        body: treeAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.teal),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading family tree',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        data: (tree) {
          if (tree == null) {
            return const Center(
              child: Text('Tree not found'),
            );
          }

          return TabBarView(
            children: [
              _buildTreeTab(context, tree, personsAsync, relationshipsAsync),
              _buildJsonTab(tree, personsAsync, relationshipsAsync),
              _buildInvertedTreeTab(context, tree, personsAsync, relationshipsAsync),
              _buildTraditionalTreeTab(context, tree, personsAsync, relationshipsAsync),
            ],
          );
        },
      ),
      ),
    );
  }

  void _showTreeOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tree Information'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Show tree info dialog
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Tree Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to tree settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share Tree'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Share tree functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Export Tree'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Export tree functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreeTab(
    BuildContext context,
    dynamic tree,
    AsyncValue<List<dynamic>> personsAsync,
    AsyncValue<List<dynamic>> relationshipsAsync,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TreeInfoCard(tree: tree),
          const SizedBox(height: 24),
          personsAsync.when(
            data: (persons) => relationshipsAsync.when(
              data: (relationships) {
                final treePersons =
                    persons.where((p) => p.treeId == treeId).toList();

                if (treePersons.isEmpty) {
                  return _EmptyTreeView(
                    onAddPerson: () => context.go('/dashboard/person/new'),
                  );
                }

                return SvgInspiredTreeView(
                  persons: treePersons,
                  relationships: relationships,
                );
              },
              loading: () => const _LoadingView(),
              error: (error, _) => _ErrorView(error: error.toString()),
            ),
            loading: () => const _LoadingView(),
            error: (error, _) => _ErrorView(error: error.toString()),
          ),
        ],
      ),
    );
  }

  Widget _buildJsonTab(
    dynamic tree,
    AsyncValue<List<dynamic>> personsAsync,
    AsyncValue<List<dynamic>> relationshipsAsync,
  ) {
    return personsAsync.when(
      data: (persons) => relationshipsAsync.when(
        data: (relationships) {
          final treePersons =
              persons.where((p) => p.treeId == treeId).toList();
          final treeRelationships =
              relationships.where((r) => r.treeId == treeId).toList();

          final data = {
            'tree': {
              'id': tree.id,
              'name': tree.name,
              'description': tree.description,
            },
            'persons': treePersons
                .map((p) => {
                      'id': p.id,
                      'name':
                          '${p.firstName}${p.lastName != null ? ' ${p.lastName}' : ''}',
                      'customFields': p.customFields,
                    })
                .toList(),
            'relationships': treeRelationships
                .map((r) => {
                      'id': r.id,
                      'type': r.type,
                      'person1Id': r.person1Id,
                      'person2Id': r.person2Id,
                    })
                .toList(),
          };

          final prettyJson =
              const JsonEncoder.withIndent('  ').convert(data);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(
                  prettyJson,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
        loading: () => const _LoadingView(),
        error: (error, _) => _ErrorView(error: error.toString()),
      ),
      loading: () => const _LoadingView(),
      error: (error, _) => _ErrorView(error: error.toString()),
    );
  }

  Widget _buildInvertedTreeTab(
    BuildContext context,
    dynamic tree,
    AsyncValue<List<dynamic>> personsAsync,
    AsyncValue<List<dynamic>> relationshipsAsync,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade600, Colors.purple.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inverted Tree View',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Roots at bottom, descendants above',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          personsAsync.when(
            data: (persons) => relationshipsAsync.when(
              data: (relationships) {
                final treePersons = persons
                    .where((p) => p.treeId == treeId)
                    .toList()
                    .cast<MockPerson>();
                final treeRelationships = relationships
                    .where((r) => r.treeId == treeId)
                    .toList()
                    .cast<MockRelationship>();

                if (treePersons.isEmpty) {
                  return _EmptyTreeView(
                    onAddPerson: () => context.go('/dashboard/person/new'),
                  );
                }

                return EnhancedTreeView(
                  persons: treePersons,
                  relationships: treeRelationships,
                  isInverted: true,
                  primaryColor: Colors.purple,
                  secondaryColor: Colors.deepPurple,
                );
              },
              loading: () => const _LoadingView(),
              error: (error, _) => _ErrorView(error: error.toString()),
            ),
            loading: () => const _LoadingView(),
            error: (error, _) => _ErrorView(error: error.toString()),
          ),
        ],
      ),
    );
  }

  Widget _buildTraditionalTreeTab(
    BuildContext context,
    dynamic tree,
    AsyncValue<List<dynamic>> personsAsync,
    AsyncValue<List<dynamic>> relationshipsAsync,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade600, Colors.teal.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Traditional Tree View',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Compact nodes, roots at top',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          personsAsync.when(
            data: (persons) => relationshipsAsync.when(
              data: (relationships) {
                final treePersons = persons
                    .where((p) => p.treeId == treeId)
                    .toList()
                    .cast<MockPerson>();
                final treeRelationships = relationships
                    .where((r) => r.treeId == treeId)
                    .toList()
                    .cast<MockRelationship>();

                if (treePersons.isEmpty) {
                  return _EmptyTreeView(
                    onAddPerson: () => context.go('/dashboard/person/new'),
                  );
                }

                return EnhancedTreeView(
                  persons: treePersons,
                  relationships: treeRelationships,
                  isInverted: false,
                  primaryColor: Colors.teal,
                  secondaryColor: Colors.cyan,
                );
              },
              loading: () => const _LoadingView(),
              error: (error, _) => _ErrorView(error: error.toString()),
            ),
            loading: () => const _LoadingView(),
            error: (error, _) => _ErrorView(error: error.toString()),
          ),
        ],
      ),
    );
  }
}

class _TreeInfoCard extends StatelessWidget {
  final tree;

  const _TreeInfoCard({required this.tree});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade600, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tree.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tree.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
      child: const Center(
        child: CircularProgressIndicator(color: Colors.teal),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;

  const _ErrorView({required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading tree',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTreeView extends StatelessWidget {
  final VoidCallback onAddPerson;

  const _EmptyTreeView({required this.onAddPerson});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_tree,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Your family tree is empty',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Add the first person to start building your family tree',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onAddPerson,
              icon: const Icon(Icons.person_add),
              label: const Text('Add First Person'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SvgInspiredTreeView extends StatelessWidget {
  final List<dynamic> persons;
  final List<dynamic> relationships;

  const SvgInspiredTreeView({
    super.key,
    required this.persons,
    required this.relationships,
  });

  static const double _nodeWidth = 180;
  static const double _nodeHeight = 110;
  static const double _horizontalSpacing = 80;
  static const double _verticalSpacing = 160;

  @override
  Widget build(BuildContext context) {
    final layout =
        _SvgTreeLayout(persons: persons, relationships: relationships);
    final positions = layout.positions;
    final generationOrder = layout.sortedGenerations;
    final generationRows = layout.generationMap;
    final size = layout.canvasSize;

    if (positions.isEmpty) {
      return const Center(
        child: Text(
          'No visualization data available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height,
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
          boundaryMargin: const EdgeInsets.all(200),
          minScale: 0.3,
          maxScale: 3,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _SvgConnectorPainter(
                      positions: positions,
                      relationships: relationships,
                      nodeWidth: _nodeWidth,
                      nodeHeight: _nodeHeight,
                    ),
                  ),
                ),
                for (final gen in generationOrder)
                  Positioned(
                    left: 16,
                    top: layout.rowOffsets[gen]! + _nodeHeight / 2 - 18,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.teal.shade200),
                      ),
                      child: Text(
                        'Gen $gen',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                for (final person in persons)
                  if (positions.containsKey(person.id))
                    Positioned(
                      left: positions[person.id]!.dx,
                      top: positions[person.id]!.dy,
                      child: _SvgTreeNodeCard(
                        person: person,
                        width: _nodeWidth,
                        height: _nodeHeight,
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

class _SvgTreeNodeCard extends StatelessWidget {
  final dynamic person;
  final double width;
  final double height;

  const _SvgTreeNodeCard({
    required this.person,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        '${person.firstName}${person.lastName != null ? ' ${person.lastName}' : ''}';
    final subtitle = person.customFields?['role'] ??
        person.customFields?['epithet'] ??
        '';

    return Container(
      width: width,
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: height + 20,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.orange.shade200, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              fullName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (subtitle != null && subtitle.isNotEmpty) ...[
            const SizedBox(height: 3),
            Flexible(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.brown,
                  height: 1.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          const SizedBox(height: 4),
          const Text(
            'Supreme',
            style: TextStyle(
              fontSize: 11,
              color: Colors.orange,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SvgTreeLayout {
  final List<dynamic> persons;
  final List<dynamic> relationships;

  late final Map<String, Offset> positions;
  late final Map<int, List<dynamic>> generationMap;
  late final List<int> sortedGenerations;
  late final Size canvasSize;
  late final Map<int, double> rowOffsets;

  _SvgTreeLayout({
    required this.persons,
    required this.relationships,
  }) {
    positions = {};
    generationMap = {};
    sortedGenerations = [];
    rowOffsets = {};
    _compute();
  }

  void _compute() {
    final generations = _calculateGenerations();
    for (final person in persons) {
      final gen = generations[person.id] ?? 0;
      generationMap.putIfAbsent(gen, () => []).add(person);
    }
    sortedGenerations
      ..clear()
      ..addAll(generationMap.keys.toList()..sort());

    final maxNodes = generationMap.values
        .fold<int>(0, (prev, list) => list.length > prev ? list.length : prev);
    final width = (maxNodes * (SvgInspiredTreeView._nodeWidth +
                SvgInspiredTreeView._horizontalSpacing)) +
        SvgInspiredTreeView._horizontalSpacing * 2;
    final height = (sortedGenerations.length *
            (SvgInspiredTreeView._nodeHeight +
                SvgInspiredTreeView._verticalSpacing)) +
        SvgInspiredTreeView._verticalSpacing * 2;
    canvasSize = Size(width, height);

    double currentY = SvgInspiredTreeView._verticalSpacing;
    for (final gen in sortedGenerations) {
      final row = generationMap[gen]!;
      final rowWidth =
          row.length * SvgInspiredTreeView._nodeWidth +
              (row.length - 1) * SvgInspiredTreeView._horizontalSpacing;
      final startX = (width - rowWidth) / 2;
      rowOffsets[gen] = currentY;

      for (var i = 0; i < row.length; i++) {
        final person = row[i];
        final x = startX +
            i *
                (SvgInspiredTreeView._nodeWidth +
                    SvgInspiredTreeView._horizontalSpacing);
        positions[person.id] = Offset(x, currentY);
      }
      currentY +=
          SvgInspiredTreeView._nodeHeight + SvgInspiredTreeView._verticalSpacing;
    }
  }

  Map<String, int> _calculateGenerations() {
    final generations = <String, int>{};
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};

    for (final rel in relationships) {
      final type = rel.type?.toString();
      if (type == 'biological_parent' || type == 'adoptive_parent') {
        parentChildMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
        childParentMap.putIfAbsent(rel.person2Id, () => []).add(rel.person1Id);
      }
    }

    for (final person in persons) {
      final gen = _extractCustomGeneration(person);
      if (gen != null) generations[person.id] = gen;
    }

    dynamic root;
    for (final person in persons) {
      if (!childParentMap.containsKey(person.id)) {
        final fullName =
            '${person.firstName} ${person.lastName ?? ''}'.toLowerCase();
        if (fullName.contains('krishna') || fullName.contains('kṛṣṇa')) {
          root = person;
          break;
        }
        root ??= person;
      }
    }

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

    for (final person in persons) {
      generations.putIfAbsent(person.id, () => 0);
    }
    return generations;
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
}

class _SvgConnectorPainter extends CustomPainter {
  final Map<String, Offset> positions;
  final List<dynamic> relationships;
  final double nodeWidth;
  final double nodeHeight;

  _SvgConnectorPainter({
    required this.positions,
    required this.relationships,
    required this.nodeWidth,
    required this.nodeHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal.withOpacity(0.4)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (final rel in relationships) {
      final type = rel.type?.toString();
      if (type != 'biological_parent' && type != 'adoptive_parent') continue;

      final parentPos = positions[rel.person1Id];
      final childPos = positions[rel.person2Id];
      if (parentPos == null || childPos == null) continue;

      final parentCenter =
          Offset(parentPos.dx + nodeWidth / 2, parentPos.dy + nodeHeight);
      final childCenter =
          Offset(childPos.dx + nodeWidth / 2, childPos.dy);

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

// which provides a cleaner top-down hierarchical visualization

class _OldTreeVisualization extends StatefulWidget {
  final List persons;
  final List relationships;
  final Function(dynamic) onPersonTap;

  const _OldTreeVisualization({
    required this.persons,
    required this.relationships,
    required this.onPersonTap,
  });

  @override
  _OldTreeVisualizationState createState() => _OldTreeVisualizationState();
}

class _OldTreeVisualizationState extends State<_OldTreeVisualization> {
  bool _isRelationshipsExpanded = false;

  Map<String, dynamic> _getCharacterTheme(String firstName) {
    switch (firstName.toLowerCase()) {
      case 'krishna':
        return {
          'emoji': '🪶',
          'color': Colors.indigo,
          'bgColor': Colors.indigo.shade50,
          'borderColor': Colors.indigo.shade300,
        };
      case 'arjuna':
        return {
          'emoji': '🏹',
          'color': Colors.green,
          'bgColor': Colors.green.shade50,
          'borderColor': Colors.green.shade300,
        };
      case 'draupadi':
        return {
          'emoji': '👑',
          'color': Colors.purple,
          'bgColor': Colors.purple.shade50,
          'borderColor': Colors.purple.shade300,
        };
      case 'yudhishthira':
        return {
          'emoji': '⚖️',
          'color': Colors.amber,
          'bgColor': Colors.amber.shade50,
          'borderColor': Colors.amber.shade300,
        };
      case 'bhima':
        return {
          'emoji': '💪',
          'color': Colors.red,
          'bgColor': Colors.red.shade50,
          'borderColor': Colors.red.shade300,
        };
      case 'nakula':
        return {
          'emoji': '🗡️',
          'color': Colors.teal,
          'bgColor': Colors.teal.shade50,
          'borderColor': Colors.teal.shade300,
        };
      case 'sahadeva':
        return {
          'emoji': '🌟',
          'color': Colors.orange,
          'bgColor': Colors.orange.shade50,
          'borderColor': Colors.orange.shade300,
        };
      case 'kunti':
        return {
          'emoji': '👸',
          'color': Colors.pink,
          'bgColor': Colors.pink.shade50,
          'borderColor': Colors.pink.shade300,
        };
      case 'pandu':
        return {
          'emoji': '👑',
          'color': Colors.blue,
          'bgColor': Colors.blue.shade50,
          'borderColor': Colors.blue.shade300,
        };
      case 'madri':
        return {
          'emoji': '🌺',
          'color': Colors.deepPurple,
          'bgColor': Colors.deepPurple.shade50,
          'borderColor': Colors.deepPurple.shade300,
        };
      default:
        return {
          'emoji': '👤',
          'color': Colors.grey,
          'bgColor': Colors.grey.shade50,
          'borderColor': Colors.grey.shade300,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Family Tree Visualization',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade700,
          ),
        ),
        const SizedBox(height: 16),

        // SVG-inspired Family Tree with Krishna at Top
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width > 768 && !_isRelationshipsExpanded
              ? MediaQuery.of(context).size.height * 0.75
              : 500,
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
              minScale: 0.1,
              maxScale: 4.0,
              constrained: false,
              child: Container(
                width: 1400,
                height: 900,
                child: Stack(
                  children: [
                    // Background
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey.shade50,
                    ),
                    // Tree structure
                    CustomPaint(
                      painter: _FamilyTreePainter(
                        persons: widget.persons,
                        relationships: widget.relationships,
                        getCharacterTheme: _getCharacterTheme,
                      ),
                      size: const Size(1400, 900),
                    ),
                    // Person nodes overlay
                    _TreePersonsOverlay(
                      persons: widget.persons,
                      relationships: widget.relationships,
                      getCharacterTheme: _getCharacterTheme,
                      onPersonTap: widget.onPersonTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        if (widget.relationships.isNotEmpty) ...[
          const SizedBox(height: 24),
          // Collapsible Relationships Header
          InkWell(
            onTap: () {
              setState(() {
                _isRelationshipsExpanded = !_isRelationshipsExpanded;
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    _isRelationshipsExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: Colors.teal.shade700,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Relationships',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade600,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${widget.relationships.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _isRelationshipsExpanded ? 'Hide' : 'Show',
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Animated container for relationships list
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isRelationshipsExpanded ? null : 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isRelationshipsExpanded ? 1.0 : 0.0,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _RelationshipsList(
                    relationships: widget.relationships,
                    persons: widget.persons,
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _PersonCard extends StatelessWidget {
  final person;
  final int relationshipCount;
  final VoidCallback onTap;

  const _PersonCard({
    required this.person,
    required this.relationshipCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: person.gender == 'male' ? Colors.blue.shade100 : Colors.pink.shade100,
                child: Icon(
                  person.gender == 'male' ? Icons.male : Icons.female,
                  color: person.gender == 'male' ? Colors.blue : Colors.pink,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${person.firstName} ${person.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (person.birthDate != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Born ${person.birthDate.year}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$relationshipCount relation${relationshipCount != 1 ? 's' : ''}',
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RelationshipsList extends StatelessWidget {
  final List relationships;
  final List persons;

  const _RelationshipsList({
    required this.relationships,
    required this.persons,
  });

  String _getPersonName(String personId) {
    try {
      final person = persons.firstWhere((p) => p.id == personId);
      return '${person.firstName} ${person.lastName}';
    } catch (e) {
      return 'Unknown';
    }
  }

  String _formatRelationshipType(String type) {
    switch (type) {
      case 'spouse':
        return 'married to';
      case 'biological_parent':
        return 'parent of';
      case 'biological_child':
        return 'child of';
      case 'sibling':
        return 'sibling of';
      default:
        return type.replaceAll('_', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: relationships.map<Widget>((relationship) {
          final person1Name = _getPersonName(relationship.person1Id);
          final person2Name = _getPersonName(relationship.person2Id);
          final relationshipType = _formatRelationshipType(relationship.type);

          return InkWell(
            onTap: () {
              // Navigate to edit relationship
              context.go('/dashboard/relationships/${relationship.id}/edit?treeId=${relationship.treeId}');
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _getRelationshipIcon(relationship.type),
                    color: Colors.teal,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '$person1Name is $relationshipType $person2Name',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (relationship.notes != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.grey[400],
                            size: 16,
                          ),
                        ),
                      Icon(
                        Icons.edit,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
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
}

class _CharacterPreview extends StatelessWidget {
  final String name;
  final String icon;
  final Color color;

  const _CharacterPreview(this.name, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              icon,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

// Family Tree Painter for drawing relationship lines
class _FamilyTreePainter extends CustomPainter {
  final List persons;
  final List relationships;
  final Function(String) getCharacterTheme;

  _FamilyTreePainter({
    required this.persons,
    required this.relationships,
    required this.getCharacterTheme,
  });

  Map<String, Offset> _calculatePositions() {
    final positions = <String, Offset>{};

    // Build family tree hierarchy
    final generations = _buildGenerationalHierarchy();

    double startY = 50;
    double generationHeight = 120;
    double personSpacing = 150;

    for (int genLevel = 0; genLevel < generations.length; genLevel++) {
      final generation = generations[genLevel];
      final y = startY + (genLevel * generationHeight);

      // Calculate total width needed for this generation
      double totalWidth = (generation.length - 1) * personSpacing;
      double startX = (800 - totalWidth) / 2; // Center the generation

      for (int i = 0; i < generation.length; i++) {
        final person = generation[i];
        positions[person.id] = Offset(
          startX + (i * personSpacing),
          y,
        );
      }
    }

    return positions;
  }

  List<List<dynamic>> _buildGenerationalHierarchy() {
    // Create a map of person relationships
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};
    final spouseMap = <String, Set<String>>{};

    // Process relationships to build family structure
    for (final relationship in relationships) {
      final person1Id = relationship.person1Id;
      final person2Id = relationship.person2Id;
      final type = relationship.type;

      if (type == 'biological_parent') {
        parentChildMap[person1Id] = (parentChildMap[person1Id] ?? [])..add(person2Id);
        childParentMap[person2Id] = (childParentMap[person2Id] ?? [])..add(person1Id);
      } else if (type == 'biological_child') {
        parentChildMap[person2Id] = (parentChildMap[person2Id] ?? [])..add(person1Id);
        childParentMap[person1Id] = (childParentMap[person1Id] ?? [])..add(person2Id);
      } else if (type == 'spouse') {
        spouseMap[person1Id] = (spouseMap[person1Id] ?? <String>{})..add(person2Id);
        spouseMap[person2Id] = (spouseMap[person2Id] ?? <String>{})..add(person1Id);
      }
    }

    // Determine generational levels
    final generationLevels = <String, int>{};
    final visited = <String>{};

    // Find root ancestors (people with no parents)
    final roots = persons.where((person) =>
      childParentMap[person.id] == null || childParentMap[person.id]!.isEmpty
    ).toList();

    // Assign generation levels starting from roots
    void assignGeneration(String personId, int level) {
      if (visited.contains(personId)) return;
      visited.add(personId);

      generationLevels[personId] = level;

      // Assign same level to spouses
      final spouses = spouseMap[personId] ?? <String>{};
      for (final spouseId in spouses) {
        if (!visited.contains(spouseId)) {
          generationLevels[spouseId] = level;
          visited.add(spouseId);
        }
      }

      // Assign next level to children
      final children = parentChildMap[personId] ?? [];
      for (final childId in children) {
        if (!visited.contains(childId)) {
          assignGeneration(childId, level + 1);
        }
      }
    }

    // Start from roots
    for (final root in roots) {
      if (!visited.contains(root.id)) {
        assignGeneration(root.id, 0);
      }
    }

    // Handle any remaining unassigned people
    for (final person in persons) {
      if (!visited.contains(person.id)) {
        generationLevels[person.id] = 0;
      }
    }

    // Group people by generation
    final maxGeneration = generationLevels.values.isEmpty ? 0 : generationLevels.values.reduce((a, b) => a > b ? a : b);
    final generations = List<List<dynamic>>.generate(maxGeneration + 1, (index) => []);

    for (final person in persons) {
      final level = generationLevels[person.id] ?? 0;
      generations[level].add(person);
    }

    // Group spouses together within each generation
    for (final generation in generations) {
      generation.sort((a, b) {
        // Try to keep spouses adjacent
        final aSpouses = spouseMap[a.id] ?? <String>{};
        final bSpouses = spouseMap[b.id] ?? <String>{};

        // Simple sorting by first name for now
        return a.firstName.compareTo(b.firstName);
      });
    }

    return generations;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final positions = _calculatePositions();
    final generations = _buildGenerationalHierarchy();

    // Paint styles for different connection types
    final spousePaint = Paint()
      ..color = Colors.red.shade300
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final parentChildPaint = Paint()
      ..color = Colors.blue.shade400
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final treeBranchPaint = Paint()
      ..color = Colors.green.shade400
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw spouse relationships (horizontal lines within same generation)
    for (final relationship in relationships) {
      if (relationship.type == 'spouse') {
        final person1Pos = positions[relationship.person1Id];
        final person2Pos = positions[relationship.person2Id];

        if (person1Pos != null && person2Pos != null) {
          // Draw horizontal line between spouses
          canvas.drawLine(person1Pos, person2Pos, spousePaint);

          // Add heart symbol
          final midPoint = Offset(
            (person1Pos.dx + person2Pos.dx) / 2,
            (person1Pos.dy + person2Pos.dy) / 2,
          );
          final heartPaint = Paint()
            ..color = Colors.red
            ..style = PaintingStyle.fill;
          canvas.drawCircle(midPoint, 4, heartPaint);
        }
      }
    }

    // Draw parent-child relationships (vertical tree branches)
    for (final relationship in relationships) {
      if (relationship.type == 'biological_parent') {
        final parentPos = positions[relationship.person1Id];
        final childPos = positions[relationship.person2Id];

        if (parentPos != null && childPos != null && parentPos.dy < childPos.dy) {
          // Draw tree-like branch from parent to child
          final midY = (parentPos.dy + childPos.dy) / 2;

          // Vertical line down from parent
          canvas.drawLine(
            Offset(parentPos.dx, parentPos.dy),
            Offset(parentPos.dx, midY),
            treeBranchPaint,
          );

          // Horizontal line across to child
          canvas.drawLine(
            Offset(parentPos.dx, midY),
            Offset(childPos.dx, midY),
            treeBranchPaint,
          );

          // Vertical line down to child
          canvas.drawLine(
            Offset(childPos.dx, midY),
            Offset(childPos.dx, childPos.dy),
            treeBranchPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Overlay widget for positioning person portraits
class _TreePersonsOverlay extends StatelessWidget {
  final List persons;
  final List relationships;
  final Function(String) getCharacterTheme;
  final Function(dynamic) onPersonTap;

  const _TreePersonsOverlay({
    required this.persons,
    required this.relationships,
    required this.getCharacterTheme,
    required this.onPersonTap,
  });

  Map<String, Offset> _calculatePositions() {
    final positions = <String, Offset>{};

    // Build family tree hierarchy (same logic as painter)
    final generations = _buildGenerationalHierarchy();

    double startY = 50;
    double generationHeight = 120;
    double personSpacing = 150;

    for (int genLevel = 0; genLevel < generations.length; genLevel++) {
      final generation = generations[genLevel];
      final y = startY + (genLevel * generationHeight);

      // Calculate total width needed for this generation
      double totalWidth = (generation.length - 1) * personSpacing;
      double startX = (800 - totalWidth) / 2; // Center the generation

      for (int i = 0; i < generation.length; i++) {
        final person = generation[i];
        positions[person.id] = Offset(
          startX + (i * personSpacing),
          y,
        );
      }
    }

    return positions;
  }

  List<List<dynamic>> _buildGenerationalHierarchy() {
    // Create a map of person relationships
    final parentChildMap = <String, List<String>>{};
    final childParentMap = <String, List<String>>{};
    final spouseMap = <String, Set<String>>{};

    // Process relationships to build family structure
    for (final relationship in relationships) {
      final person1Id = relationship.person1Id;
      final person2Id = relationship.person2Id;
      final type = relationship.type;

      if (type == 'biological_parent') {
        parentChildMap[person1Id] = (parentChildMap[person1Id] ?? [])..add(person2Id);
        childParentMap[person2Id] = (childParentMap[person2Id] ?? [])..add(person1Id);
      } else if (type == 'biological_child') {
        parentChildMap[person2Id] = (parentChildMap[person2Id] ?? [])..add(person1Id);
        childParentMap[person1Id] = (childParentMap[person1Id] ?? [])..add(person2Id);
      } else if (type == 'spouse') {
        spouseMap[person1Id] = (spouseMap[person1Id] ?? <String>{})..add(person2Id);
        spouseMap[person2Id] = (spouseMap[person2Id] ?? <String>{})..add(person1Id);
      }
    }

    // Determine generational levels
    final generationLevels = <String, int>{};
    final visited = <String>{};

    // Find root ancestors (people with no parents)
    final roots = persons.where((person) =>
      childParentMap[person.id] == null || childParentMap[person.id]!.isEmpty
    ).toList();

    // Assign generation levels starting from roots
    void assignGeneration(String personId, int level) {
      if (visited.contains(personId)) return;
      visited.add(personId);

      generationLevels[personId] = level;

      // Assign same level to spouses
      final spouses = spouseMap[personId] ?? <String>{};
      for (final spouseId in spouses) {
        if (!visited.contains(spouseId)) {
          generationLevels[spouseId] = level;
          visited.add(spouseId);
        }
      }

      // Assign next level to children
      final children = parentChildMap[personId] ?? [];
      for (final childId in children) {
        if (!visited.contains(childId)) {
          assignGeneration(childId, level + 1);
        }
      }
    }

    // Start from roots
    for (final root in roots) {
      if (!visited.contains(root.id)) {
        assignGeneration(root.id, 0);
      }
    }

    // Handle any remaining unassigned people
    for (final person in persons) {
      if (!visited.contains(person.id)) {
        generationLevels[person.id] = 0;
      }
    }

    // Group people by generation
    final maxGeneration = generationLevels.values.isEmpty ? 0 : generationLevels.values.reduce((a, b) => a > b ? a : b);
    final generations = List<List<dynamic>>.generate(maxGeneration + 1, (index) => []);

    for (final person in persons) {
      final level = generationLevels[person.id] ?? 0;
      generations[level].add(person);
    }

    // Group spouses together within each generation
    for (final generation in generations) {
      generation.sort((a, b) {
        // Try to keep spouses adjacent
        final aSpouses = spouseMap[a.id] ?? <String>{};
        final bSpouses = spouseMap[b.id] ?? <String>{};

        // Simple sorting by first name for now
        return a.firstName.compareTo(b.firstName);
      });
    }

    return generations;
  }

  @override
  Widget build(BuildContext context) {
    final positions = _calculatePositions();

    return Stack(
      children: persons.map<Widget>((person) {
        final position = positions[person.id];
        if (position == null) return const SizedBox.shrink();

        final theme = getCharacterTheme(person.firstName);

        return Positioned(
          left: position.dx - 30, // Center the 60px wide widget
          top: position.dy - 30,  // Center the 60px tall widget
          child: GestureDetector(
            onTap: () => onPersonTap(person),
            child: _PersonPortrait(
              person: person,
              emoji: theme['emoji'] as String,
              color: theme['color'] as Color,
              bgColor: theme['bgColor'] as Color,
              borderColor: theme['borderColor'] as Color,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Individual person portrait widget
class _PersonPortrait extends StatelessWidget {
  final dynamic person;
  final String emoji;
  final Color color;
  final Color bgColor;
  final Color borderColor;

  const _PersonPortrait({
    required this.person,
    required this.emoji,
    required this.color,
    required this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 3),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor.withOpacity(0.5)),
          ),
          child: Text(
            person.firstName,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
