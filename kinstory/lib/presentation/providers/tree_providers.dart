import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/mock_database.dart';
import 'auth_providers.dart';
import 'person_providers.dart';

// Provider for getting trees for the current user
final treesProvider = FutureProvider<List<MockTree>>((ref) async {
  final database = ref.read(databaseProvider);
  final currentUser = ref.read(currentUserProvider);

  if (currentUser == null) {
    return [];
  }

  // For demo, get all trees (in real app would filter by user)
  final trees = database.getAllTrees();
  return trees;
});

// Provider for getting a specific tree by ID
final treeProvider = FutureProvider.family<MockTree?, String>((ref, treeId) async {
  final database = ref.read(databaseProvider);
  final trees = await ref.read(treesProvider.future);

  try {
    return trees.firstWhere((tree) => tree.id == treeId);
  } catch (e) {
    return null;
  }
});

// Provider for getting relationships in a tree
final treeRelationshipsProvider = FutureProvider.family<List<MockRelationship>, String>((ref, treeId) async {
  final database = ref.read(databaseProvider);
  final relationships = database.getRelationshipsByTreeId(treeId);
  return relationships;
});

// Provider for getting relationships for a specific person
final personRelationshipsProvider = FutureProvider.family<List<MockRelationship>, String>((ref, personId) async {
  final database = ref.read(databaseProvider);
  final relationships = database.getRelationshipsForPerson(personId);
  return relationships;
});

// Tree statistics provider
final treeStatsProvider = Provider.family<Map<String, dynamic>, String>((ref, treeId) {
  final personsAsync = ref.watch(personsProvider);
  final relationshipsAsync = ref.watch(treeRelationshipsProvider(treeId));

  return personsAsync.when(
    data: (persons) {
      return relationshipsAsync.when(
        data: (relationships) {
          final treePersons = persons.where((p) => p.treeId == treeId).toList();
          final stats = <String, dynamic>{
            'totalPersons': treePersons.length,
            'totalRelationships': relationships.length,
            'generations': _calculateGenerations(treePersons, relationships),
            'families': _calculateFamilies(relationships),
          };
          return stats;
        },
        loading: () => <String, dynamic>{},
        error: (_, __) => <String, dynamic>{},
      );
    },
    loading: () => <String, dynamic>{},
    error: (_, __) => <String, dynamic>{},
  );
});

// Helper function to calculate generations (simplified)
int _calculateGenerations(List<MockPerson> persons, List<MockRelationship> relationships) {
  // Simple heuristic based on birth dates
  if (persons.isEmpty) return 0;

  final birthYears = persons
    .where((p) => p.birthDate != null)
    .map((p) => p.birthDate!.year)
    .toList();

  if (birthYears.isEmpty) return 1;

  birthYears.sort();
  final span = birthYears.last - birthYears.first;
  return (span / 25).ceil().clamp(1, 10); // Assume 25 years per generation
}

// Helper function to calculate family units
int _calculateFamilies(List<MockRelationship> relationships) {
  // Count spouse/partner relationships as family units
  return relationships.where((r) => r.type == 'spouse' || r.type == 'partner').length;
}

// Tree visualization data provider
class TreeNode {
  final MockPerson person;
  final List<TreeNode> children;
  final List<TreeNode> spouses;
  final int generation;
  final String? parentId;

  TreeNode({
    required this.person,
    this.children = const [],
    this.spouses = const [],
    required this.generation,
    this.parentId,
  });
}

final treeVisualizationProvider = FutureProvider.family<List<TreeNode>, String>((ref, treeId) async {
  final persons = await ref.read(personsProvider.future) as List<MockPerson>;
  final relationships = await ref.read(treeRelationshipsProvider(treeId).future);

  final treePersons = persons.where((p) => p.treeId == treeId).toList();

  // Build a simple tree structure
  return _buildTreeNodes(treePersons, relationships);
});

List<TreeNode> _buildTreeNodes(List<MockPerson> persons, List<MockRelationship> relationships) {
  final nodes = <String, TreeNode>{};
  final parentChildMap = <String, List<String>>{};
  final spouseMap = <String, List<String>>{};

  // Initialize nodes
  for (final person in persons) {
    nodes[person.id] = TreeNode(
      person: person,
      generation: 0, // Will be calculated later
    );
  }

  // Process relationships
  for (final relationship in relationships) {
    final type = relationship.type;
    final person1Id = relationship.person1Id;
    final person2Id = relationship.person2Id;

    if (type == 'biological_parent' || type == 'adoptive_parent') {
      parentChildMap[person1Id] = (parentChildMap[person1Id] ?? [])..add(person2Id);
    } else if (type == 'biological_child' || type == 'adoptive_child') {
      parentChildMap[person2Id] = (parentChildMap[person2Id] ?? [])..add(person1Id);
    } else if (type == 'spouse' || type == 'partner') {
      spouseMap[person1Id] = (spouseMap[person1Id] ?? [])..add(person2Id);
      spouseMap[person2Id] = (spouseMap[person2Id] ?? [])..add(person1Id);
    }
  }

  // For now, return a flat list (tree structure would need more complex logic)
  return nodes.values.toList();
}