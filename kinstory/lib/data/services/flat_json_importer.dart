import 'dart:convert';

import 'package:kinstory/domain/entities/person.dart';
import 'package:kinstory/domain/entities/relationship.dart';
import 'package:kinstory/domain/entities/tree.dart';
import 'package:kinstory/data/datasources/local/mock_database.dart';

/// Service to import flat JSON format with explicit persons and relationships
class FlatJsonImporter {
  final MockDatabase _db;

  // Track created persons for relationship mapping
  final Map<String, Person> _createdPersons = {};
  final Map<String, String> _idMap = {}; // JSON id -> Person id

  FlatJsonImporter({
    MockDatabase? database,
  }) : _db = database ?? MockDatabase.instance;

  /// Import family tree from flat JSON format
  Future<ImportResult> importFromJson(
    String jsonString, {
    String? userId,
    String? treeId,
  }) async {
    try {
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      userId ??= 'demo-user';
      treeId ??= 'demo-tree-123';

      // Create tree
      final tree = await _createTree(treeId, userId);

      // Process persons
      if (jsonData.containsKey('persons')) {
        final persons = jsonData['persons'] as List;
        await _processPersons(persons, treeId, userId);
      }

      // Process relationships
      if (jsonData.containsKey('relationships')) {
        final relationships = jsonData['relationships'] as List;
        await _processRelationships(relationships, treeId, userId);
      }

      return ImportResult(
        success: true,
        treeId: treeId,
        personsImported: _createdPersons.length,
        relationshipsImported: _db.getRelationshipsByTreeId(treeId).length,
        message: 'Successfully imported ${_createdPersons.length} persons',
      );
    } catch (e, stackTrace) {
      print('Import error: $e');
      print('Stack trace: $stackTrace');
      return ImportResult(
        success: false,
        message: 'Failed to import: $e',
      );
    }
  }

  /// Create the family tree
  Future<FamilyTree> _createTree(
    String treeId,
    String userId,
  ) async {
    final tree = FamilyTree(
      id: treeId,
      name: 'Krishna & Pandava Family Tree',
      description: 'Complete genealogy from Krishna through Yadavas and Pandavas',
      visibility: TreeVisibility.private,
      ownerId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _db.createTree(tree);
    return tree;
  }

  /// Process persons from JSON
  Future<void> _processPersons(
    List<dynamic> persons,
    String treeId,
    String userId,
  ) async {
    for (final personData in persons) {
      if (personData is! Map<String, dynamic>) continue;

      final jsonId = personData['id'] as String;
      final firstName = personData['firstName'] as String;
      final lastName = personData['lastName'] as String?;
      final genderStr = personData['gender'] as String? ?? 'male';
      final generation = personData['generation'] as int?;
      final epithet = personData['epithet'] as String?;
      final role = personData['role'] as String?;

      // Parse gender
      Gender gender;
      switch (genderStr.toLowerCase()) {
        case 'female':
          gender = Gender.female;
          break;
        case 'other':
          gender = Gender.other;
          break;
        default:
          gender = Gender.male;
      }

      // Create person
      final person = Person(
        id: 'person-$jsonId',
        treeId: treeId,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        isLiving: false,
        createdBy: userId,
        updatedBy: userId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        customFields: {
          if (generation != null) 'generation': generation,
          if (epithet != null) 'epithet': epithet,
          if (role != null) 'role': role,
        },
      );

      _createdPersons[person.id] = person;
      _idMap[jsonId] = person.id;

      // Save to database
      await _db.createPerson(person);
    }

    print('✅ Imported ${_createdPersons.length} persons');
  }

  /// Process relationships from JSON
  Future<void> _processRelationships(
    List<dynamic> relationships,
    String treeId,
    String userId,
  ) async {
    int imported = 0;
    for (final relData in relationships) {
      if (relData is! Map<String, dynamic>) continue;

      final person1JsonId = relData['person1Id'] as String;
      final person2JsonId = relData['person2Id'] as String;
      final typeStr = relData['type'] as String;
      final notes = relData['notes'] as String?;

      // Map IDs
      final person1Id = _idMap[person1JsonId];
      final person2Id = _idMap[person2JsonId];

      if (person1Id == null || person2Id == null) {
        print('⚠️  Skipping relationship: person not found ($person1JsonId -> $person2JsonId)');
        continue;
      }

      // Parse relationship type
      RelationshipType? type;
      switch (typeStr.toLowerCase()) {
        case 'spouse':
          type = RelationshipType.spouse;
          break;
        case 'biological_parent':
          type = RelationshipType.biologicalParent;
          break;
        case 'biological_child':
          type = RelationshipType.biologicalChild;
          break;
        case 'adoptive_parent':
          type = RelationshipType.adoptiveParent;
          break;
        case 'adoptive_child':
          type = RelationshipType.adoptiveChild;
          break;
        case 'foster_parent':
          type = RelationshipType.fosterParent;
          break;
        case 'foster_child':
          type = RelationshipType.fosterChild;
          break;
        case 'sibling':
          type = RelationshipType.sibling;
          break;
        case 'half_sibling':
          type = RelationshipType.halfSibling;
          break;
        case 'partner':
          type = RelationshipType.partner;
          break;
        case 'guardian':
          type = RelationshipType.guardian;
          break;
        case 'godparent':
          type = RelationshipType.godparent;
          break;
        default:
          print('⚠️  Unknown relationship type: $typeStr, skipping');
          type = null;
      }

      if (type == null) {
        continue; // Skip unknown relationship types
      }

      // Create relationship
      final relationship = Relationship(
        id: 'rel-$person1JsonId-$person2JsonId-${imported++}',
        treeId: treeId,
        type: type,
        person1Id: person1Id,
        person2Id: person2Id,
        status: RelationshipStatus.current,
        createdBy: userId,
        updatedBy: userId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        notes: notes,
      );

      // Save to database
      await _db.createRelationship(relationship);
    }

    print('✅ Imported $imported relationships');
  }
}

/// Result of import operation
class ImportResult {
  final bool success;
  final String? treeId;
  final int personsImported;
  final int relationshipsImported;
  final String message;

  ImportResult({
    required this.success,
    this.treeId,
    this.personsImported = 0,
    this.relationshipsImported = 0,
    required this.message,
  });
}
