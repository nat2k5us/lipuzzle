import 'dart:collection';
import 'dart:math';

import '../../domain/entities/person.dart';
import '../../domain/entities/relationship.dart';

/// Service for calculating generation levels in a family tree
class GenerationCalculator {
  /// Calculate generations using multiple strategies
  Map<String, int> calculateGenerations(
    List<Person> persons,
    List<Relationship> relationships, {
    GenerationStrategy strategy = GenerationStrategy.rootBased,
    String? rootPersonId,
  }) {
    switch (strategy) {
      case GenerationStrategy.rootBased:
        if (rootPersonId == null) {
          // Try to find root automatically
          rootPersonId = _findRootPerson(persons, relationships);
          if (rootPersonId == null) {
            throw GenerationCalculationException(
                'No root person found and none specified');
          }
        }
        return _calculateFromRoot(persons, relationships, rootPersonId);
      case GenerationStrategy.manual:
        return _useManualGenerations(persons);
      case GenerationStrategy.hybrid:
        return _hybridCalculation(persons, relationships, rootPersonId);
    }
  }

  /// Find the root person (person with no parents)
  String? _findRootPerson(List<Person> persons, List<Relationship> relationships) {
    final hasParent = <String>{};

    for (final rel in relationships) {
      if (rel.type == RelationshipType.biologicalParent ||
          rel.type == RelationshipType.adoptiveParent) {
        hasParent.add(rel.person2Id);
      }
    }

    // Find persons with no parents
    final rootCandidates = persons
        .where((p) => !hasParent.contains(p.id))
        .toList();

    if (rootCandidates.isEmpty) {
      return null;
    }

    // If Krishna exists, prioritize as root
    final krishna = rootCandidates.firstWhere(
      (p) => p.firstName.toLowerCase().contains('krishna') ||
             p.firstName.contains('Kṛṣṇa'),
      orElse: () => rootCandidates.first,
    );

    return krishna.id;
  }

  /// Root-based calculation (Krishna at generation 0)
  Map<String, int> _calculateFromRoot(
    List<Person> persons,
    List<Relationship> relationships,
    String rootPersonId,
  ) {
    final generations = <String, int>{rootPersonId: 0};
    final queue = Queue<String>()..add(rootPersonId);
    final visited = <String>{rootPersonId};

    // Build adjacency maps for efficient traversal
    final childMap = _buildChildMap(relationships);
    final spouseMap = _buildSpouseMap(relationships);

    while (queue.isNotEmpty) {
      final currentId = queue.removeFirst();
      final currentGen = generations[currentId]!;

      // Process all children (biological, adopted, divine)
      for (final childId in childMap[currentId] ?? []) {
        if (!visited.contains(childId)) {
          generations[childId] = currentGen + 1;
          queue.add(childId);
          visited.add(childId);
        } else {
          // Handle conflicts - use minimum generation
          generations[childId] = min(generations[childId]!, currentGen + 1);
        }
      }

      // Process spouses (same generation)
      for (final spouseId in spouseMap[currentId] ?? []) {
        if (!visited.contains(spouseId)) {
          generations[spouseId] = currentGen;
          queue.add(spouseId);
          visited.add(spouseId);
        }
      }
    }

    // Handle any unvisited persons (disconnected subgraphs)
    for (final person in persons) {
      if (!generations.containsKey(person.id)) {
        // Try to calculate based on relatives
        final gen = _calculateGenerationFromRelatives(
          person.id, relationships, generations);
        generations[person.id] = gen ?? 0;
      }
    }

    return generations;
  }

  /// Use manual generation values from persons
  Map<String, int> _useManualGenerations(List<Person> persons) {
    final generations = <String, int>{};

    for (final person in persons) {
      final manualGen = person.customFields?['generation'] as int?;
      if (manualGen != null) {
        generations[person.id] = manualGen;
      } else {
        // Default to 0 if not specified
        generations[person.id] = 0;
      }
    }

    return generations;
  }

  /// Hybrid calculation - start with root-based, apply manual overrides
  Map<String, int> _hybridCalculation(
    List<Person> persons,
    List<Relationship> relationships,
    String? rootPersonId,
  ) {
    // Start with root-based if we have a root
    var generations = rootPersonId != null
        ? _calculateFromRoot(persons, relationships, rootPersonId)
        : <String, int>{};

    // Apply manual overrides from JSON
    for (final person in persons) {
      final override = person.customFields?['generation_override'] as int?;
      if (override != null) {
        generations[person.id] = override;
      }
    }

    // Resolve conflicts with heuristics
    generations = _resolveGenerationConflicts(
      persons, relationships, generations);

    return generations;
  }

  /// Calculate generation from relatives if person is isolated
  int? _calculateGenerationFromRelatives(
    String personId,
    List<Relationship> relationships,
    Map<String, int> existingGenerations,
  ) {
    // Check parents
    final parents = _getParents(personId, relationships);
    if (parents.isNotEmpty) {
      final parentGens = parents
          .map((p) => existingGenerations[p])
          .where((g) => g != null)
          .cast<int>()
          .toList();
      if (parentGens.isNotEmpty) {
        return parentGens.reduce(min) + 1;
      }
    }

    // Check children
    final children = _getChildren(personId, relationships);
    if (children.isNotEmpty) {
      final childGens = children
          .map((c) => existingGenerations[c])
          .where((g) => g != null)
          .cast<int>()
          .toList();
      if (childGens.isNotEmpty) {
        return childGens.reduce(max) - 1;
      }
    }

    // Check spouses
    final spouses = _getSpouses(personId, relationships);
    if (spouses.isNotEmpty) {
      final spouseGens = spouses
          .map((s) => existingGenerations[s])
          .where((g) => g != null)
          .cast<int>()
          .toList();
      if (spouseGens.isNotEmpty) {
        return (spouseGens.reduce((a, b) => a + b) / spouseGens.length).round();
      }
    }

    return null;
  }

  /// Resolve conflicts (e.g., person has parents at different generations)
  Map<String, int> _resolveGenerationConflicts(
    List<Person> persons,
    List<Relationship> relationships,
    Map<String, int> generations,
  ) {
    final conflicts = _detectConflicts(relationships, generations);

    for (final conflict in conflicts) {
      // Strategy: Use earlier generation (closer to root) for divine births
      // Or use average + 1 for normal births
      final parents = _getParents(conflict.personId, relationships);
      if (parents.isNotEmpty) {
        final parentGens = parents
            .map((p) => generations[p] ?? 0)
            .toList();

        // Check if this is a divine birth
        final isDivineBirth = relationships.any((r) =>
            (r.person1Id == conflict.personId || r.person2Id == conflict.personId) &&
            r.customFields?['method'] == 'divine_intervention');

        if (isDivineBirth) {
          // Use minimum parent generation + 1
          generations[conflict.personId] = parentGens.reduce(min) + 1;
        } else {
          // Use average parent generation + 1
          final avgParentGen = parentGens.reduce((a, b) => a + b) / parentGens.length;
          generations[conflict.personId] = (avgParentGen + 1).round();
        }
      }
    }

    return generations;
  }

  /// Detect generation conflicts
  List<GenerationConflict> _detectConflicts(
    List<Relationship> relationships,
    Map<String, int> generations,
  ) {
    final conflicts = <GenerationConflict>[];

    for (final rel in relationships) {
      if (rel.type == RelationshipType.biologicalParent ||
          rel.type == RelationshipType.adoptiveParent) {
        final parentGen = generations[rel.person1Id];
        final childGen = generations[rel.person2Id];

        if (parentGen != null && childGen != null) {
          if (childGen != parentGen + 1) {
            conflicts.add(GenerationConflict(
              rel.person2Id,
              [parentGen + 1, childGen],
              'Parent-child generation mismatch',
            ));
          }
        }
      } else if (rel.type == RelationshipType.spouse ||
                 rel.type == RelationshipType.partner) {
        final person1Gen = generations[rel.person1Id];
        final person2Gen = generations[rel.person2Id];

        if (person1Gen != null && person2Gen != null) {
          if ((person1Gen - person2Gen).abs() > 1) {
            conflicts.add(GenerationConflict(
              rel.person2Id,
              [person1Gen, person2Gen],
              'Spouse generation mismatch',
            ));
          }
        }
      }
    }

    return conflicts;
  }

  /// Build parent -> children map for efficient traversal
  Map<String, List<String>> _buildChildMap(List<Relationship> relationships) {
    final childMap = <String, List<String>>{};

    for (final rel in relationships) {
      if (_isParentChildRelationship(rel.type)) {
        childMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
      }
    }

    return childMap;
  }

  /// Build spouse map for same generation assignment
  Map<String, List<String>> _buildSpouseMap(List<Relationship> relationships) {
    final spouseMap = <String, List<String>>{};

    for (final rel in relationships) {
      if (rel.type == RelationshipType.spouse ||
          rel.type == RelationshipType.partner) {
        spouseMap.putIfAbsent(rel.person1Id, () => []).add(rel.person2Id);
        spouseMap.putIfAbsent(rel.person2Id, () => []).add(rel.person1Id);
      }
    }

    return spouseMap;
  }

  /// Get parents of a person
  List<String> _getParents(String personId, List<Relationship> relationships) {
    return relationships
        .where((r) => r.person2Id == personId && _isParentChildRelationship(r.type))
        .map((r) => r.person1Id)
        .toList();
  }

  /// Get children of a person
  List<String> _getChildren(String personId, List<Relationship> relationships) {
    return relationships
        .where((r) => r.person1Id == personId && _isParentChildRelationship(r.type))
        .map((r) => r.person2Id)
        .toList();
  }

  /// Get spouses of a person
  List<String> _getSpouses(String personId, List<Relationship> relationships) {
    final spouses = <String>[];

    for (final rel in relationships) {
      if (rel.type == RelationshipType.spouse ||
          rel.type == RelationshipType.partner) {
        if (rel.person1Id == personId) {
          spouses.add(rel.person2Id);
        } else if (rel.person2Id == personId) {
          spouses.add(rel.person1Id);
        }
      }
    }

    return spouses;
  }

  /// Check if relationship type is parent-child
  bool _isParentChildRelationship(RelationshipType type) {
    return type == RelationshipType.biologicalParent ||
           type == RelationshipType.adoptiveParent ||
           type == RelationshipType.fosterParent;
  }
}

/// Generation calculation strategy
enum GenerationStrategy {
  /// Calculate from root person (Krishna)
  rootBased,

  /// Use generation values from JSON
  manual,

  /// Combine both with conflict resolution
  hybrid,
}

/// Generation conflict information
class GenerationConflict {
  final String personId;
  final List<int> conflictingGenerations;
  final String reason;

  GenerationConflict(this.personId, this.conflictingGenerations, this.reason);
}

/// Exception for generation calculation errors
class GenerationCalculationException implements Exception {
  final String message;

  GenerationCalculationException(this.message);

  @override
  String toString() => 'GenerationCalculationException: $message';
}