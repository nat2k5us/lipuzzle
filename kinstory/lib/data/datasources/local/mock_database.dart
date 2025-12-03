// Mock database provider to replace SQLite/Drift for UI testing
// This allows the app to build and run without database dependencies

import 'dart:convert';

import 'package:kinstory/domain/entities/tree.dart';
import 'package:kinstory/domain/entities/person.dart' as domain;
import 'package:kinstory/domain/entities/relationship.dart' as domain;
import 'package:kinstory/data/services/avatar_service.dart';

class MockRelationship {
  final String id;
  final String treeId;
  final String type; // Using string for simplicity instead of enum
  final String person1Id;
  final String person2Id;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? notes;
  final String status; // 'current', 'ended', etc.
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  MockRelationship({
    required this.id,
    required this.treeId,
    required this.type,
    required this.person1Id,
    required this.person2Id,
    this.startDate,
    this.endDate,
    this.notes,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MockTree {
  final String id;
  final String name;
  final String description;
  final String ownerId;
  final String visibility;
  final String settings;
  final DateTime createdAt;
  final DateTime updatedAt;

  MockTree({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.visibility,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MockPerson {
  final String id;
  final String firstName;
  final String? lastName;
  final DateTime? birthDate;
  final String? birthPlace;
  final DateTime? deathDate;
  final String? deathPlace;
  final String gender;
  final String? bio;
  final String treeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic> customFields;
  final String? avatarUrl;

  MockPerson({
    required this.id,
    required this.firstName,
    this.lastName,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.deathPlace,
    required this.gender,
    this.bio,
    required this.treeId,
    required this.createdAt,
    required this.updatedAt,
    this.customFields = const {},
    this.avatarUrl,
  });
}

class MockStory {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final String? treeId; // Optional - story can be general or tree-specific
  final List<String> personIds; // People mentioned in the story
  final List<String> tags;
  final String category; // 'memory', 'tradition', 'milestone', 'historical', etc.
  final DateTime? eventDate; // When the story took place
  final String? location;
  final String privacy; // 'public', 'family', 'private'
  final List<String> mediaUrls; // Photos, videos, audio
  final int likesCount;
  final int commentsCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  MockStory({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    this.treeId,
    this.personIds = const [],
    this.tags = const [],
    required this.category,
    this.eventDate,
    this.location,
    required this.privacy,
    this.mediaUrls = const [],
    this.likesCount = 0,
    this.commentsCount = 0,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MockDatabase {
  MockDatabase._internal();

  static final MockDatabase instance = MockDatabase._internal();

  factory MockDatabase() => instance;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  void markInitialized() {
    _isInitialized = true;
  }

  void reset() {
    _trees.clear();
    _persons.clear();
    _relationships.clear();
    _stories.clear();
    _isInitialized = false;
  }

  // In-memory storage
  final List<MockTree> _trees = [];
  final List<MockPerson> _persons = [];
  final List<MockRelationship> _relationships = [];
  final List<MockStory> _stories = [];

  // Manual demo data removed. Real data is imported at runtime.

  // Tree operations
  Future<void> createTree(FamilyTree tree) async {
    final settingsJson = jsonEncode(tree.settings.toJson());
    final mockTree = MockTree(
      id: tree.id,
      name: tree.name,
      description: tree.description ?? '',
      ownerId: tree.ownerId,
      visibility: tree.visibility.name,
      settings: settingsJson,
      createdAt: tree.createdAt,
      updatedAt: tree.updatedAt,
    );
    _trees.add(mockTree);
  }

  List<MockTree> getAllTrees() {
    print('🔍 MockDatabase: Getting all trees, found ${_trees.length}');
    return List.from(_trees);
  }

  MockTree? getTreeByName(String name) {
    print('🔍 MockDatabase: Looking for tree with name: $name');
    try {
      final tree = _trees.firstWhere((tree) => tree.name == name);
      print('✅ MockDatabase: Found tree: ${tree.name}');
      return tree;
    } catch (e) {
      print('❌ MockDatabase: No tree found with name: $name');
      return null;
    }
  }

  void addTree(MockTree tree) {
    print('➕ MockDatabase: Adding tree: ${tree.name}');
    _trees.add(tree);
  }

  // Person operations
  Future<void> createPerson(domain.Person person) async {
    // Get avatar URL using AvatarService (checks for custom images first, then generates)
    final avatarUrl = AvatarService().getAvatarUrl(
      firstName: person.firstName,
      lastName: person.lastName,
      gender: _mapGender(person.gender),
    );

    final mockPerson = MockPerson(
      id: person.id,
      firstName: person.firstName,
      lastName: person.lastName,
      birthDate: person.dateOfBirth,
      birthPlace: person.placeOfBirth?.name,
      deathDate: person.dateOfDeath,
      deathPlace: person.placeOfDeath?.name,
      gender: _mapGender(person.gender),
      bio: person.biography,
      treeId: person.treeId,
      createdAt: person.createdAt,
      updatedAt: person.updatedAt,
      customFields: Map<String, dynamic>.from(person.customFields),
      avatarUrl: avatarUrl,
    );
    _persons.add(mockPerson);
  }

  List<MockPerson> getPersonsByTreeId(String treeId) {
    print('🔍 MockDatabase: Getting persons for tree: $treeId');
    final persons = _persons.where((person) => person.treeId == treeId).toList();
    print('✅ MockDatabase: Found ${persons.length} persons for tree $treeId');
    return persons;
  }

  void addPerson(MockPerson person) {
    print('➕ MockDatabase: Adding person: ${person.firstName} ${person.lastName}');
    _persons.add(person);
  }

  void removePerson(String personId) {
    print('➖ MockDatabase: Removing person with id: $personId');
    _persons.removeWhere((person) => person.id == personId);
  }

  MockPerson? getPersonById(String personId) {
    print('🔍 MockDatabase: Looking for person with id: $personId');
    try {
      final person = _persons.firstWhere((person) => person.id == personId);
      print('✅ MockDatabase: Found person: ${person.firstName} ${person.lastName}');
      return person;
    } catch (e) {
      print('❌ MockDatabase: No person found with id: $personId');
      return null;
    }
  }

  List<MockPerson> getAllPersons() {
    print('🔍 MockDatabase: Getting all persons, found ${_persons.length}');
    return List.from(_persons);
  }

  // Relationship operations
  Future<void> createRelationship(domain.Relationship relationship) async {
    final mockRelationship = MockRelationship(
      id: relationship.id,
      treeId: relationship.treeId,
      type: _mapRelationshipType(relationship.type),
      person1Id: relationship.person1Id,
      person2Id: relationship.person2Id,
      startDate: relationship.startDate,
      endDate: relationship.endDate,
      notes: relationship.notes,
      status: _mapRelationshipStatus(relationship.status),
      createdBy: relationship.createdBy,
      createdAt: relationship.createdAt,
      updatedAt: relationship.updatedAt,
    );
    _relationships.add(mockRelationship);
  }

  List<MockRelationship> getRelationshipsByTreeId(String treeId) {
    print('🔍 MockDatabase: Getting relationships for tree: $treeId');
    final relationships = _relationships.where((relationship) => relationship.treeId == treeId).toList();
    print('✅ MockDatabase: Found ${relationships.length} relationships for tree $treeId');
    return relationships;
  }

  List<MockRelationship> getRelationshipsForPerson(String personId) {
    print('🔍 MockDatabase: Getting relationships for person: $personId');
    final relationships = _relationships.where((relationship) =>
      relationship.person1Id == personId || relationship.person2Id == personId
    ).toList();
    print('✅ MockDatabase: Found ${relationships.length} relationships for person $personId');
    return relationships;
  }

  void addRelationship(MockRelationship relationship) {
    print('➕ MockDatabase: Adding relationship between ${relationship.person1Id} and ${relationship.person2Id}');
    _relationships.add(relationship);
  }

  void removeRelationship(String relationshipId) {
    print('➖ MockDatabase: Removing relationship with id: $relationshipId');
    _relationships.removeWhere((relationship) => relationship.id == relationshipId);
  }

  MockRelationship? getRelationshipById(String relationshipId) {
    print('🔍 MockDatabase: Looking for relationship with id: $relationshipId');
    try {
      final relationship = _relationships.firstWhere((relationship) => relationship.id == relationshipId);
      print('✅ MockDatabase: Found relationship: ${relationship.type}');
      return relationship;
    } catch (e) {
      print('❌ MockDatabase: No relationship found with id: $relationshipId');
      return null;
    }
  }

  List<MockRelationship> getAllRelationships() {
    print('🔍 MockDatabase: Getting all relationships, found ${_relationships.length}');
    return List.from(_relationships);
  }

  // Story operations
  List<MockStory> getStoriesByTreeId(String treeId) {
    print('🔍 MockDatabase: Getting stories for tree: $treeId');
    final stories = _stories.where((story) => story.treeId == treeId).toList();
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt)); // Sort by newest first
    print('✅ MockDatabase: Found ${stories.length} stories for tree $treeId');
    return stories;
  }

  List<MockStory> getStoriesForPerson(String personId) {
    print('🔍 MockDatabase: Getting stories for person: $personId');
    final stories = _stories.where((story) => story.personIds.contains(personId)).toList();
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    print('✅ MockDatabase: Found ${stories.length} stories for person $personId');
    return stories;
  }

  List<MockStory> getStoriesByCategory(String category) {
    print('🔍 MockDatabase: Getting stories for category: $category');
    final stories = _stories.where((story) => story.category == category).toList();
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    print('✅ MockDatabase: Found ${stories.length} stories for category $category');
    return stories;
  }

  List<MockStory> getStoriesByTag(String tag) {
    print('🔍 MockDatabase: Getting stories for tag: $tag');
    final stories = _stories.where((story) => story.tags.contains(tag)).toList();
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    print('✅ MockDatabase: Found ${stories.length} stories for tag $tag');
    return stories;
  }

  void addStory(MockStory story) {
    print('➕ MockDatabase: Adding story: ${story.title}');
    _stories.add(story);
  }

  void removeStory(String storyId) {
    print('➖ MockDatabase: Removing story with id: $storyId');
    _stories.removeWhere((story) => story.id == storyId);
  }

  void updateStory(MockStory updatedStory) {
    print('✏️ MockDatabase: Updating story: ${updatedStory.title}');
    final index = _stories.indexWhere((story) => story.id == updatedStory.id);
    if (index != -1) {
      _stories[index] = updatedStory;
      print('✅ MockDatabase: Story updated successfully');
    } else {
      print('❌ MockDatabase: Story not found for update');
    }
  }

  MockStory? getStoryById(String storyId) {
    print('🔍 MockDatabase: Looking for story with id: $storyId');
    try {
      final story = _stories.firstWhere((story) => story.id == storyId);
      print('✅ MockDatabase: Found story: ${story.title}');
      return story;
    } catch (e) {
      print('❌ MockDatabase: No story found with id: $storyId');
      return null;
    }
  }

  List<MockStory> getAllStories() {
    print('🔍 MockDatabase: Getting all stories, found ${_stories.length}');
    final stories = List<MockStory>.from(_stories);
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return stories;
  }

  List<MockStory> searchStories(String query) {
    print('🔍 MockDatabase: Searching stories for: $query');
    final lowercaseQuery = query.toLowerCase();
    final stories = _stories.where((story) {
      return story.title.toLowerCase().contains(lowercaseQuery) ||
             story.content.toLowerCase().contains(lowercaseQuery) ||
             story.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery)) ||
             story.location?.toLowerCase().contains(lowercaseQuery) == true;
    }).toList();
    stories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    print('✅ MockDatabase: Found ${stories.length} stories matching "$query"');
    return stories;
  }

  // Generic query simulation
  Future<List<T>> select<T>() async {
    print('🔍 MockDatabase: Generic select called');
    // Return empty list for generic queries
    return <T>[];
  }

  // Table access simulation
  MockTreesTable get treesTable => MockTreesTable(this);
  MockPersonsTable get personsTable => MockPersonsTable(this);

  String _mapGender(domain.Gender? gender) {
    switch (gender) {
      case domain.Gender.female:
        return 'female';
      case domain.Gender.other:
        return 'other';
      case domain.Gender.unknown:
        return 'unknown';
      case domain.Gender.male:
      default:
        return 'male';
    }
  }

  String _mapRelationshipType(domain.RelationshipType type) {
    switch (type) {
      case domain.RelationshipType.biologicalParent:
        return 'biological_parent';
      case domain.RelationshipType.biologicalChild:
        return 'biological_child';
      case domain.RelationshipType.adoptiveParent:
        return 'adoptive_parent';
      case domain.RelationshipType.adoptiveChild:
        return 'adoptive_child';
      case domain.RelationshipType.stepParent:
        return 'step_parent';
      case domain.RelationshipType.stepChild:
        return 'step_child';
      case domain.RelationshipType.fosterParent:
        return 'foster_parent';
      case domain.RelationshipType.fosterChild:
        return 'foster_child';
      case domain.RelationshipType.spouse:
        return 'spouse';
      case domain.RelationshipType.partner:
        return 'partner';
      case domain.RelationshipType.sibling:
        return 'sibling';
      case domain.RelationshipType.halfSibling:
        return 'half_sibling';
      case domain.RelationshipType.stepSibling:
        return 'step_sibling';
      case domain.RelationshipType.guardian:
        return 'guardian';
      case domain.RelationshipType.godparent:
        return 'godparent';
    }

    return 'other';
  }

  String _mapRelationshipStatus(domain.RelationshipStatus? status) {
    switch (status) {
      case domain.RelationshipStatus.ended:
        return 'ended';
      case domain.RelationshipStatus.divorced:
        return 'divorced';
      case domain.RelationshipStatus.widowed:
        return 'widowed';
      case domain.RelationshipStatus.separated:
        return 'separated';
      case domain.RelationshipStatus.current:
      case null:
        return 'current';
    }

    return 'current';
  }
}

class MockTreesTable {
  final MockDatabase _db;
  MockTreesTable(this._db);

  Future<List<MockTree>> get() async {
    return _db.getAllTrees();
  }
}

class MockPersonsTable {
  final MockDatabase _db;
  MockPersonsTable(this._db);

  Future<List<MockPerson>> get() async {
    return _db._persons;
  }
}
