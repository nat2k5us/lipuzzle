import 'dart:convert';
import 'package:uuid/uuid.dart';

import 'package:kinstory/domain/entities/person.dart';
import 'package:kinstory/domain/entities/relationship.dart';
import 'package:kinstory/domain/entities/tree.dart';
import 'package:kinstory/domain/services/generation_calculator.dart';
import 'package:kinstory/data/datasources/local/mock_database.dart';

/// Service to import Krishna family tree JSON format
class KrishnaJsonImporter {
  final MockDatabase _db;
  final GenerationCalculator _genCalculator;
  final _uuid = const Uuid();

  // Track created persons for relationship mapping
  final Map<String, Person> _createdPersons = {};
  final Map<String, String> _nameToIdMap = {};
  final List<Relationship> _createdRelationships = [];
  final Map<String, int> _generationOverrides = {};

  KrishnaJsonImporter({
    MockDatabase? database,
    GenerationCalculator? calculator,
  })  : _db = database ?? MockDatabase.instance,
        _genCalculator = calculator ?? GenerationCalculator();

  /// Import Krishna family tree from JSON
  Future<ImportResult> importFromJson(
    String jsonString, {
    String? userId,
    String? treeId,
  }) async {
    try {
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      userId ??= 'imported-user-${_uuid.v4()}';
      treeId ??= 'imported-tree-${_uuid.v4()}';

      // Create tree
      final tree = await _createTree(jsonData, treeId, userId);

      // Load generation overrides if present
      if (jsonData.containsKey('generation_overrides')) {
        final overrides = jsonData['generation_overrides'];
        if (overrides is Map) {
          overrides.forEach((key, value) {
            if (key is String) {
              final parsed = value is num
                  ? value.toInt()
                  : int.tryParse(value.toString());
              if (parsed != null) {
                _generationOverrides[key.toLowerCase()] = parsed;
              }
            }
          });
        }
      }

      // Process supreme being (Krishna)
      if (jsonData.containsKey('supreme')) {
        await _processSupreme(jsonData['supreme'], treeId, userId);
      }

      // Process creation hierarchy (Brahma)
      if (jsonData.containsKey('creation')) {
        await _processCreation(jsonData['creation'], treeId, userId);
      }

      // Process Prajapati lineages
      if (jsonData.containsKey('prajapati_lineages')) {
        await _processPrajapatiLineages(
          jsonData['prajapati_lineages'], treeId, userId);
      }

      // Process Manus
      if (jsonData.containsKey('manus')) {
        await _processManus(jsonData['manus'], treeId, userId);
      }

      // Process Dynasties
      if (jsonData.containsKey('dynasties')) {
        await _processDynasties(jsonData['dynasties'], treeId, userId);
      }

      // Calculate generations
      final persons = _createdPersons.values.toList();
      final relationships = _createdRelationships;

      final generations = _genCalculator.calculateGenerations(
        persons,
        relationships,
        strategy: GenerationStrategy.rootBased,
        rootPersonId: _nameToIdMap['krishna'] ?? _nameToIdMap['Śrī Kṛṣṇa'],
      );

      // Update person generations
      for (final entry in generations.entries) {
        final person = _createdPersons[entry.key];
        if (person != null) {
          final updated = person.copyWith(
            customFields: {
              ...?person.customFields,
              'generation': entry.value,
            },
          );
          _createdPersons[entry.key] = updated;
        }
      }

      // Save to database
      await _saveToDatabase(tree, persons, relationships);

      return ImportResult(
        success: true,
        treeId: treeId,
        personsImported: persons.length,
        relationshipsImported: relationships.length,
        message: 'Successfully imported Krishna family tree',
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
    Map<String, dynamic> jsonData,
    String treeId,
    String userId,
  ) async {
    final tree = FamilyTree(
      id: treeId,
      name: 'The Srimad-Bhagavatam Dynasty',
      description: 'Complete genealogy from Krishna through multiple dynasties',
      visibility: TreeVisibility.private,
      ownerId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _db.createTree(tree);
    return tree;
  }

  /// Process the supreme being (Krishna)
  Future<void> _processSupreme(
    Map<String, dynamic> supreme,
    String treeId,
    String userId,
  ) async {
    final krishna = _createPerson(
      name: supreme['name'] ?? 'Śrī Kṛṣṇa',
      epithet: supreme['epithet'],
      treeId: treeId,
      userId: userId,
      attributes: {
        'divine_status': 'supreme',
        'expansions': supreme['expansions'],
        'notes': supreme['notes'],
      },
      defaultLastName: 'Supreme',
    );

    _createdPersons[krishna.id] = krishna;
    _nameToIdMap['krishna'] = krishna.id;
    _nameToIdMap['Śrī Kṛṣṇa'] = krishna.id;
    _nameToIdMap['Krishna'] = krishna.id;
  }

  /// Process creation (Brahma)
  Future<void> _processCreation(
    Map<String, dynamic> creation,
    String treeId,
    String userId,
  ) async {
    if (creation.containsKey('brahma')) {
      final brahmaData = creation['brahma'];

      final brahma = _createPerson(
        name: brahmaData['name'] ?? 'Lord Brahmā',
        treeId: treeId,
        userId: userId,
        attributes: {
          'origin': brahmaData['origin'],
          'role': brahmaData['role'],
          'divine_status': 'deva',
        },
      );

      _createdPersons[brahma.id] = brahma;
      _nameToIdMap['brahma'] = brahma.id;
      _nameToIdMap['Lord Brahmā'] = brahma.id;
      _nameToIdMap['Brahmā'] = brahma.id;

      // Create relationship: Krishna -> Brahma
      if (_nameToIdMap.containsKey('krishna')) {
        final rel = _createRelationship(
          person1Id: _nameToIdMap['krishna']!,
          person2Id: brahma.id,
          type: RelationshipType.biologicalParent,
          treeId: treeId,
          userId: userId,
          notes: brahmaData['origin'],
        );
        _createdRelationships.add(rel);
      }

      // Process Prajapatis
      final prajapatis = brahmaData['prajapatis'] as List?;
      if (prajapatis != null) {
        for (final prajaName in prajapatis) {
          final praja = _createPerson(
            name: prajaName.toString(),
            treeId: treeId,
            userId: userId,
            attributes: {
              'role': 'Prajapati',
              'divine_status': 'deva',
            },
          );

          _createdPersons[praja.id] = praja;
          _nameToIdMap[prajaName.toString().toLowerCase()] = praja.id;
          _nameToIdMap[prajaName.toString()] = praja.id;

          // Create relationship: Brahma -> Prajapati
          final rel = _createRelationship(
            person1Id: brahma.id,
            person2Id: praja.id,
            type: RelationshipType.biologicalParent,
            treeId: treeId,
            userId: userId,
            notes: 'Mental creation by Brahma',
          );
          _createdRelationships.add(rel);
        }
      }
    }
  }

  /// Process Prajapati lineages
  Future<void> _processPrajapatiLineages(
    Map<String, dynamic> lineages,
    String treeId,
    String userId,
  ) async {
    for (final entry in lineages.entries) {
      final lineageData = entry.value as Map<String, dynamic>;

      // Process main Prajapati if not already created
      final prajaName = lineageData['name'] ?? entry.key;
      if (!_nameToIdMap.containsKey(prajaName.toLowerCase())) {
        final praja = _createPerson(
          name: prajaName,
          treeId: treeId,
          userId: userId,
          attributes: {
            'role': 'Prajapati',
            'divine_status': 'deva',
          },
        );
        _createdPersons[praja.id] = praja;
        _nameToIdMap[prajaName.toLowerCase()] = praja.id;
        _nameToIdMap[prajaName] = praja.id;
      }

      // Process spouse
      if (lineageData.containsKey('spouse')) {
        final spouseData = lineageData['spouse'];
        if (spouseData != null) {
          final spouseName = spouseData is Map ? spouseData['name'] : spouseData;
          if (spouseName != null) {
            final spouse = _createPerson(
              name: spouseName.toString(),
              treeId: treeId,
              userId: userId,
              gender: Gender.female,
              attributes: spouseData is Map ? {
                'note': spouseData['note'],
                'parents': spouseData['parents'],
              } : null,
            );

            _createdPersons[spouse.id] = spouse;
            _nameToIdMap[spouseName.toString().toLowerCase()] = spouse.id;

            // Create spouse relationship
            final rel = _createRelationship(
              person1Id: _nameToIdMap[prajaName.toLowerCase()]!,
              person2Id: spouse.id,
              type: RelationshipType.spouse,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }
        }
      }

      // Process spouses (for multiple spouses like Kasyapa)
      if (lineageData.containsKey('spouses')) {
        final spousesList = lineageData['spouses'] as List;
        final parentId = _nameToIdMap[prajaName.toLowerCase()]!;

        for (final spouseData in spousesList) {
          final spouseName = spouseData['name'];
          if (spouseName != null) {
            final spouse = _createPerson(
              name: spouseName,
              treeId: treeId,
              userId: userId,
              gender: Gender.female,
              attributes: {
                'children_summary': spouseData['children_summary'],
              },
              defaultLastName: 'Wife of Vasudeva',
            );

            _createdPersons[spouse.id] = spouse;
            _nameToIdMap[spouseName.toLowerCase()] = spouse.id;

            // Create spouse relationship
            final rel = _createRelationship(
              person1Id: parentId,
              person2Id: spouse.id,
              type: RelationshipType.spouse,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }
        }
      }

      // Process children
      if (lineageData.containsKey('children')) {
        final children = lineageData['children'] as List;
        final parentId = _nameToIdMap[prajaName.toLowerCase()]!;

        for (final childData in children) {
          final childName = childData['name'];
          if (childName != null) {
            final child = _createPerson(
              name: childName,
              treeId: treeId,
              userId: userId,
              attributes: {
                'epithet': childData['epithet'],
                'role': childData['role'],
              },
            );

            _createdPersons[child.id] = child;
            _nameToIdMap[childName.toLowerCase()] = child.id;

            // Create parent-child relationship
            final rel = _createRelationship(
              person1Id: parentId,
              person2Id: child.id,
              type: RelationshipType.biologicalParent,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }
        }
      }
    }
  }

  /// Process Manus
  Future<void> _processManus(
    Map<String, dynamic> manus,
    String treeId,
    String userId,
  ) async {
    for (final entry in manus.entries) {
      final manuData = entry.value as Map<String, dynamic>;

      // Create Manu
      final manu = _createPerson(
        name: manuData['name'] ?? entry.key,
        treeId: treeId,
        userId: userId,
        attributes: {
          'position': manuData['position'],
          'divine_status': 'human',
        },
      );

      _createdPersons[manu.id] = manu;
      _nameToIdMap[manuData['name']?.toLowerCase() ?? entry.key.toLowerCase()] = manu.id;

      // Process spouse
      if (manuData['spouse'] != null) {
        final spouse = _createPerson(
          name: manuData['spouse'],
          treeId: treeId,
          userId: userId,
          gender: Gender.female,
        );

        _createdPersons[spouse.id] = spouse;
        _nameToIdMap[manuData['spouse'].toLowerCase()] = spouse.id;

        // Create spouse relationship
        final rel = _createRelationship(
          person1Id: manu.id,
          person2Id: spouse.id,
          type: RelationshipType.spouse,
          treeId: treeId,
          userId: userId,
        );
        _createdRelationships.add(rel);
      }

      // Process children
      if (manuData.containsKey('children')) {
        final children = manuData['children'] as List;

        for (final childData in children) {
          final childName = childData['name'];
          if (childName != null) {
            final child = _createPerson(
              name: childName,
              treeId: treeId,
              userId: userId,
              attributes: {
                'epithet': childData['epithet'],
                'children_summary': childData['children_summary'],
              },
            );

            _createdPersons[child.id] = child;
            _nameToIdMap[childName.toLowerCase()] = child.id;

            // Create parent-child relationship
            final rel = _createRelationship(
              person1Id: manu.id,
              person2Id: child.id,
              type: RelationshipType.biologicalParent,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }
        }
      }
    }
  }

  /// Process dynasties (Solar and Lunar)
  Future<void> _processDynasties(
    Map<String, dynamic> dynasties,
    String treeId,
    String userId,
  ) async {
    // Process key persons from dynasties
    // We'll focus on important figures mentioned in the JSON

    // Process Vasudeva family for Krishna connection
    if (dynasties.containsKey('lunar_dynasty')) {
      final lunar = dynasties['lunar_dynasty'];
      if (lunar.containsKey('Yadu_line_to_Krishna')) {
        final yaduLine = lunar['Yadu_line_to_Krishna'];
        if (yaduLine.containsKey('Vasudeva_family')) {
          await _processVasudevaFamily(
            yaduLine['Vasudeva_family'], treeId, userId);
        }

        // Process Krishna's details
        if (yaduLine.containsKey('Krishna')) {
          await _processKrishnaDetails(yaduLine['Krishna'], treeId, userId);
        }
      }
    }
  }

  /// Process Vasudeva family
  Future<void> _processVasudevaFamily(
    Map<String, dynamic> family,
    String treeId,
    String userId,
  ) async {
    // Create Vasudeva
    final vasudeva = _createPerson(
      name: 'Vasudeva',
      treeId: treeId,
      userId: userId,
      gender: Gender.male,
    );
    _createdPersons[vasudeva.id] = vasudeva;
    _nameToIdMap['vasudeva'] = vasudeva.id;

    // Process spouses (Devaki, Rohini)
    if (family.containsKey('spouses')) {
      final spouses = family['spouses'] as List;
      for (final spouseData in spouses) {
        final spouseName = spouseData['name'];
        if (spouseName != null) {
          final spouse = _createPerson(
            name: spouseName,
            treeId: treeId,
            userId: userId,
            gender: Gender.female,
            attributes: {
              'children_summary': spouseData['children_summary'],
            },
            defaultLastName: 'Wife of Vasudeva',
          );

          _createdPersons[spouse.id] = spouse;
          _nameToIdMap[spouseName.toLowerCase()] = spouse.id;

          // Create spouse relationship
          final rel = _createRelationship(
            person1Id: vasudeva.id,
            person2Id: spouse.id,
            type: RelationshipType.spouse,
            treeId: treeId,
            userId: userId,
          );
          _createdRelationships.add(rel);
        }
      }
    }

    // Process Kunti connection
    if (family.containsKey('Kunti_connection')) {
      final kuntiData = family['Kunti_connection'];
      final kunti = _createPerson(
        name: kuntiData['name'] ?? 'Kuntī',
        treeId: treeId,
        userId: userId,
        gender: Gender.female,
        attributes: {
          'relationship': kuntiData['relationship'],
          'note': kuntiData['note'],
        },
        defaultLastName: 'Aunt of Krishna',
      );

      _createdPersons[kunti.id] = kunti;
      _nameToIdMap['kunti'] = kunti.id;
      _nameToIdMap['kuntī'] = kunti.id;

      // Create sibling relationship with Vasudeva
      final rel = _createRelationship(
        person1Id: vasudeva.id,
        person2Id: kunti.id,
        type: RelationshipType.sibling,
        treeId: treeId,
        userId: userId,
        notes: kuntiData['note'],
      );
      _createdRelationships.add(rel);
    }
  }

  /// Process Krishna's details
  Future<void> _processKrishnaDetails(
    Map<String, dynamic> krishnaData,
    String treeId,
    String userId,
  ) async {
    // Update Krishna's details if already exists
    final krishnaId = _nameToIdMap['krishna'];
    if (krishnaId != null) {
      final existingKrishna = _createdPersons[krishnaId];
      if (existingKrishna != null) {
        final updatedKrishna = existingKrishna.copyWith(
          customFields: {
            ...existingKrishna.customFields,
            'birth_label': 'Self Manifested',
            'birth_location': 'Center of Multi Universe',
          },
          placeOfBirth: const Place(name: 'Center of Multi Universe'),
        );
        _createdPersons[krishnaId] = updatedKrishna;

        // Add parent relationships if Vasudeva and Devaki exist
        if (_nameToIdMap.containsKey('vasudeva')) {
          final rel = _createRelationship(
            person1Id: _nameToIdMap['vasudeva']!,
            person2Id: krishnaId,
            type: RelationshipType.biologicalParent,
            treeId: treeId,
            userId: userId,
          );
          _createdRelationships.add(rel);
        }

        if (_nameToIdMap.containsKey('devakī')) {
          final rel = _createRelationship(
            person1Id: _nameToIdMap['devakī']!,
            person2Id: krishnaId,
            type: RelationshipType.biologicalParent,
            treeId: treeId,
            userId: userId,
          );
          _createdRelationships.add(rel);
        }

        // Add foster parents
        if (krishnaData.containsKey('foster_parents')) {
          final fosterParents = krishnaData['foster_parents'];

          // Create Nanda
          if (fosterParents['father'] != null) {
            final nanda = _createPerson(
              name: fosterParents['father'],
              treeId: treeId,
              userId: userId,
              gender: Gender.male,
              defaultLastName: 'Foster father of Krishna',
            );
            _createdPersons[nanda.id] = nanda;

            final rel = _createRelationship(
              person1Id: nanda.id,
              person2Id: krishnaId,
              type: RelationshipType.fosterParent,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }

          // Create Yashoda
          if (fosterParents['mother'] != null) {
            final yashoda = _createPerson(
              name: fosterParents['mother'],
              treeId: treeId,
              userId: userId,
              gender: Gender.female,
              defaultLastName: 'Foster mother of Krishna',
            );
            _createdPersons[yashoda.id] = yashoda;

            final rel = _createRelationship(
              person1Id: yashoda.id,
              person2Id: krishnaId,
              type: RelationshipType.fosterParent,
              treeId: treeId,
              userId: userId,
            );
            _createdRelationships.add(rel);
          }
        }
      }
    }
  }

  /// Create a person entity
  Person _createPerson({
    required String name,
    required String treeId,
    required String userId,
    String? epithet,
    Gender? gender,
    Map<String, dynamic>? attributes,
    String? defaultLastName,
  }) {
    // Parse name into first and last
    final nameParts = name.split(' ');
    final firstName = nameParts.first;
    final parsedLastName =
        nameParts.length > 1 ? nameParts.sublist(1).join(' ') : null;
    var fallbackLastName = defaultLastName;
    if (fallbackLastName == null && attributes != null) {
      final role = attributes['role'];
      if (role is String && role.isNotEmpty) {
        fallbackLastName = role;
      }
      final status = attributes['divine_status'];
      if (fallbackLastName == null &&
          status is String &&
          status.isNotEmpty) {
        fallbackLastName = status;
      }
      final note = attributes['note'];
      if (fallbackLastName == null && note is String && note.isNotEmpty) {
        fallbackLastName = note;
      }
    }

    final lastName = (parsedLastName == null || parsedLastName.isEmpty)
        ? fallbackLastName
        : parsedLastName;
    final normalizedName = name.toLowerCase();
    final overrideGeneration = _generationOverrides[normalizedName] ??
        _generationOverrides[firstName.toLowerCase()];

    return Person(
      id: _uuid.v4(),
      treeId: treeId,
      firstName: firstName,
      lastName: lastName,
      gender: gender ?? Gender.male,
      isLiving: false,
      createdBy: userId,
      updatedBy: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      customFields: {
        if (epithet != null) 'epithet': epithet,
        if (attributes != null) ...attributes,
        if (overrideGeneration != null) 'generation': overrideGeneration,
      },
    );
  }

  /// Create a relationship entity
  Relationship _createRelationship({
    required String person1Id,
    required String person2Id,
    required RelationshipType type,
    required String treeId,
    required String userId,
    String? notes,
  }) {
    return Relationship(
      id: _uuid.v4(),
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
  }

  /// Save all data to database
  Future<void> _saveToDatabase(
    FamilyTree tree,
    List<Person> persons,
    List<Relationship> relationships,
  ) async {
    // Add persons to database
    for (final person in persons) {
      await _db.createPerson(person);
    }

    // Add relationships to database
    for (final relationship in relationships) {
      await _db.createRelationship(relationship);
    }
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
