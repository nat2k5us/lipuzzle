import 'package:uuid/uuid.dart';
// DISABLED: import '../datasources/local/app_database.dart'; // Causes SQLite/Drift build issues
// DISABLED: import 'package:drift/drift.dart'; // Causes SQLite/Drift build issues

class MahabharataDemoData {
  static const Uuid _uuid = Uuid();

  // Demo account credentials
  static const String demoEmail = 'demo@mahabharata.com';
  static const String demoPassword = 'Krishna123!';
  static const String demoFirstName = 'Veda';
  static const String demoLastName = 'Vyasa';

  // Family tree data
  static Future<void> createDemoData(AppDatabase database) async {
    // Create demo tree
    final treeId = _uuid.v4();
    final demoUserId = _uuid.v4();

    // Create demo user (will be handled by auth system)
    await database.into(database.usersTable).insertOnConflictUpdate(
      UsersTableCompanion.insert(
        id: demoUserId,
        email: demoEmail,
        firstName: demoFirstName,
        lastName: demoLastName,
        profilePictureUrl: const Value(null),
        preferences: Value(const <String, dynamic>{}),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Create Mahabharata family tree
    await database.into(database.treesTable).insertOnConflictUpdate(
      TreesTableCompanion.insert(
        id: treeId,
        name: 'The Mahabharata Dynasty',
        description: Value('The legendary family tree from the Hindu epic Mahabharata, spanning multiple generations from King Shantanu to the Pandavas and Kauravas.'),
        ownerId: demoUserId,
        visibility: 'public',
        settings: Value(const <String, dynamic>{
          'theme': 'traditional',
          'showDates': true,
          'showRelationships': true,
          'privacy': 'family'
        }),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Add tree member
    await database.into(database.treeMembersTable).insertOnConflictUpdate(
      TreeMembersTableCompanion.insert(
        id: _uuid.v4(),
        treeId: treeId,
        userId: demoUserId,
        role: 'owner',
        permissions: Value(const <String, dynamic>{
          'canEdit': true,
          'canInvite': true,
          'canDelete': true
        }),
        joinedAt: DateTime.now(),
      ),
    );

    // Create persons - 5+ generations of Mahabharata family
    final persons = await _createPersons(database, treeId, demoUserId);
    await _createRelationships(database, treeId, persons);
    await _createEvents(database, treeId, persons, demoUserId);
    await _createStories(database, treeId, persons, demoUserId);
  }

  static Future<Map<String, String>> _createPersons(AppDatabase database, String treeId, String userId) async {
    final persons = <String, String>{};
    final now = DateTime.now();

    // Generation 1: Ancestors
    persons['shantanu'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Shantanu',
      'gender': 'male',
      'isLiving': false,
      'biography': 'King of Hastinapura, father of Bhishma and grandfather of Pandu and Dhritarashtra.',
      'occupation': ['King', 'Ruler'],
      'dateOfBirth': DateTime(1000, 1, 1), // Mythical dates
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    persons['ganga'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Ganga',
      'gender': 'female',
      'isLiving': false,
      'biography': 'River goddess, first wife of King Shantanu and mother of Bhishma.',
      'dateOfBirth': DateTime(1000, 1, 1),
      'placeOfBirth': {'name': 'Divine Realm', 'country': 'Celestial'},
    });

    persons['satyavati'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Satyavati',
      'gender': 'female',
      'isLiving': false,
      'biography': 'Second wife of King Shantanu, mother of Vyasa, grandmother of Pandu and Dhritarashtra.',
      'dateOfBirth': DateTime(1005, 1, 1),
      'placeOfBirth': {'name': 'Fisherman\\'s village', 'country': 'Bharatvarsha'},
    });

    // Generation 2: Bhishma and Vyasa
    persons['bhishma'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Bhishma',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Son of Shantanu and Ganga. Took a vow of celibacy. Known as the grandfather of the Kuru dynasty.',
      'occupation': ['Warrior', 'Guardian', 'Regent'],
      'dateOfBirth': DateTime(1020, 1, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    persons['vyasa'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Krishna Dwaipayana',
      'lastName': 'Vyasa',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Son of Satyavati, sage who authored the Mahabharata. Father of Pandu, Dhritarashtra, and Vidura.',
      'occupation': ['Sage', 'Author', 'Scholar'],
      'dateOfBirth': DateTime(1010, 1, 1),
      'placeOfBirth': {'name': 'Yamuna Island', 'country': 'Bharatvarsha'},
    });

    // Generation 3: Pandu, Dhritarashtra, Vidura
    persons['pandu'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Pandu',
      'gender': 'male',
      'isLiving': false,
      'biography': 'King of Hastinapura, father of the five Pandavas. Known for his pale complexion.',
      'occupation': ['King', 'Ruler'],
      'dateOfBirth': DateTime(1040, 1, 1),
      'dateOfDeath': DateTime(1070, 1, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    persons['dhritarashtra'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Dhritarashtra',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Blind king of Hastinapura, father of the hundred Kauravas including Duryodhana.',
      'occupation': ['King', 'Ruler'],
      'dateOfBirth': DateTime(1040, 2, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    persons['vidura'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Vidura',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Son of Vyasa, known for his wisdom and righteousness. Advisor to the Kuru dynasty.',
      'occupation': ['Minister', 'Advisor', 'Sage'],
      'dateOfBirth': DateTime(1040, 3, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    // Generation 4: Wives
    persons['kunti'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Pritha',
      'nicknames': ['Kunti'],
      'gender': 'female',
      'isLiving': false,
      'biography': 'Queen of Pandu, mother of Yudhishthira, Bhima, Arjuna, and adoptive mother of Nakula and Sahadeva.',
      'dateOfBirth': DateTime(1045, 1, 1),
      'placeOfBirth': {'name': 'Kunti Kingdom', 'country': 'Bharatvarsha'},
    });

    persons['madri'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Madri',
      'gender': 'female',
      'isLiving': false,
      'biography': 'Second wife of Pandu, mother of Nakula and Sahadeva.',
      'dateOfBirth': DateTime(1046, 1, 1),
      'placeOfBirth': {'name': 'Madra Kingdom', 'country': 'Bharatvarsha'},
    });

    persons['gandhari'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Gandhari',
      'gender': 'female',
      'isLiving': false,
      'biography': 'Queen of Dhritarashtra, mother of the hundred Kauravas. Blindfolded herself for life.',
      'dateOfBirth': DateTime(1045, 2, 1),
      'placeOfBirth': {'name': 'Gandhara Kingdom', 'country': 'Bharatvarsha'},
    });

    // Generation 5: The Pandavas
    persons['yudhishthira'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Yudhishthira',
      'nicknames': ['Dharmaraja'],
      'gender': 'male',
      'isLiving': false,
      'biography': 'Eldest Pandava, son of Kunti and Dharma. Known for his adherence to truth and dharma.',
      'occupation': ['King', 'Ruler', 'Warrior'],
      'dateOfBirth': DateTime(1065, 1, 1),
      'placeOfBirth': {'name': 'Forest hermitage', 'country': 'Bharatvarsha'},
    });

    persons['bhima'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Bhimasena',
      'nicknames': ['Bhima', 'Vrikodara'],
      'gender': 'male',
      'isLiving': false,
      'biography': 'Second Pandava, son of Kunti and Vayu. Known for his immense strength and appetite.',
      'occupation': ['Warrior', 'Prince'],
      'dateOfBirth': DateTime(1066, 1, 1),
      'placeOfBirth': {'name': 'Forest hermitage', 'country': 'Bharatvarsha'},
    });

    persons['arjuna'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Arjuna',
      'nicknames': ['Partha', 'Savyasachi'],
      'gender': 'male',
      'isLiving': false,
      'biography': 'Third Pandava, son of Kunti and Indra. Greatest archer of his time, beloved of Krishna.',
      'occupation': ['Warrior', 'Archer', 'Prince'],
      'dateOfBirth': DateTime(1067, 1, 1),
      'placeOfBirth': {'name': 'Forest hermitage', 'country': 'Bharatvarsha'},
    });

    persons['nakula'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Nakula',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Fourth Pandava, son of Madri and Ashwini Kumar. Known for his beauty and skill with horses.',
      'occupation': ['Warrior', 'Horse trainer', 'Prince'],
      'dateOfBirth': DateTime(1068, 1, 1),
      'placeOfBirth': {'name': 'Forest hermitage', 'country': 'Bharatvarsha'},
    });

    persons['sahadeva'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Sahadeva',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Youngest Pandava, son of Madri and Ashwini Kumar. Known for his knowledge of astrology.',
      'occupation': ['Warrior', 'Astrologer', 'Prince'],
      'dateOfBirth': DateTime(1068, 1, 1),
      'placeOfBirth': {'name': 'Forest hermitage', 'country': 'Bharatvarsha'},
    });

    // Key Kauravas
    persons['duryodhana'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Duryodhana',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Eldest Kaurava, son of Dhritarashtra and Gandhari. Main antagonist in the Mahabharata.',
      'occupation': ['Prince', 'Warrior', 'Ruler'],
      'dateOfBirth': DateTime(1065, 6, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    persons['dushasana'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Dushasana',
      'gender': 'male',
      'isLiving': false,
      'biography': 'Second eldest Kaurava, brother of Duryodhana. Known for dishonoring Draupadi.',
      'occupation': ['Prince', 'Warrior'],
      'dateOfBirth': DateTime(1066, 1, 1),
      'placeOfBirth': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
    });

    // Important relatives
    persons['draupadi'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Krishnaa',
      'nicknames': ['Draupadi', 'Panchali'],
      'gender': 'female',
      'isLiving': false,
      'biography': 'Wife of all five Pandavas, daughter of King Drupada. Central figure in the Mahabharata.',
      'dateOfBirth': DateTime(1070, 1, 1),
      'placeOfBirth': {'name': 'Panchala Kingdom', 'country': 'Bharatvarsha'},
    });

    persons['krishna'] = await _insertPerson(database, treeId, userId, {
      'firstName': 'Krishna',
      'nicknames': ['Vasudeva', 'Govinda'],
      'gender': 'male',
      'isLiving': false,
      'biography': 'Avatar of Vishnu, cousin of Pandavas, charioteer and guide to Arjuna. Spoke the Bhagavad Gita.',
      'occupation': ['King', 'Divine Avatar', 'Philosopher'],
      'dateOfBirth': DateTime(1065, 8, 1),
      'placeOfBirth': {'name': 'Mathura', 'country': 'Bharatvarsha'},
    });

    return persons;
  }

  static Future<String> _insertPerson(AppDatabase database, String treeId, String userId, Map<String, dynamic> data) async {
    final id = _uuid.v4();
    await database.into(database.personsTable).insertOnConflictUpdate(
      PersonsTableCompanion.insert(
        id: id,
        treeId: treeId,
        firstName: data['firstName'],
        lastName: Value(data['lastName']),
        nicknames: data['nicknames'] ?? [],
        gender: Value(data['gender']),
        isLiving: data['isLiving'] ?? false,
        biography: Value(data['biography']),
        occupation: data['occupation'] ?? [],
        dateOfBirth: Value(data['dateOfBirth']),
        dateOfDeath: Value(data['dateOfDeath']),
        placeOfBirth: Value(data['placeOfBirth']),
        createdBy: userId,
        updatedBy: userId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    return id;
  }

  static Future<void> _createRelationships(AppDatabase database, String treeId, Map<String, String> persons) async {
    final relationships = [
      // Marriages
      {'person1': 'shantanu', 'person2': 'ganga', 'type': 'spouse'},
      {'person1': 'shantanu', 'person2': 'satyavati', 'type': 'spouse'},
      {'person1': 'pandu', 'person2': 'kunti', 'type': 'spouse'},
      {'person1': 'pandu', 'person2': 'madri', 'type': 'spouse'},
      {'person1': 'dhritarashtra', 'person2': 'gandhari', 'type': 'spouse'},
      {'person1': 'yudhishthira', 'person2': 'draupadi', 'type': 'spouse'},
      {'person1': 'bhima', 'person2': 'draupadi', 'type': 'spouse'},
      {'person1': 'arjuna', 'person2': 'draupadi', 'type': 'spouse'},
      {'person1': 'nakula', 'person2': 'draupadi', 'type': 'spouse'},
      {'person1': 'sahadeva', 'person2': 'draupadi', 'type': 'spouse'},

      // Parent-child relationships
      {'person1': 'shantanu', 'person2': 'bhishma', 'type': 'father'},
      {'person1': 'ganga', 'person2': 'bhishma', 'type': 'mother'},
      {'person1': 'vyasa', 'person2': 'pandu', 'type': 'father'},
      {'person1': 'vyasa', 'person2': 'dhritarashtra', 'type': 'father'},
      {'person1': 'vyasa', 'person2': 'vidura', 'type': 'father'},
      {'person1': 'pandu', 'person2': 'yudhishthira', 'type': 'father'},
      {'person1': 'kunti', 'person2': 'yudhishthira', 'type': 'mother'},
      {'person1': 'pandu', 'person2': 'bhima', 'type': 'father'},
      {'person1': 'kunti', 'person2': 'bhima', 'type': 'mother'},
      {'person1': 'pandu', 'person2': 'arjuna', 'type': 'father'},
      {'person1': 'kunti', 'person2': 'arjuna', 'type': 'mother'},
      {'person1': 'pandu', 'person2': 'nakula', 'type': 'father'},
      {'person1': 'madri', 'person2': 'nakula', 'type': 'mother'},
      {'person1': 'pandu', 'person2': 'sahadeva', 'type': 'father'},
      {'person1': 'madri', 'person2': 'sahadeva', 'type': 'mother'},
      {'person1': 'dhritarashtra', 'person2': 'duryodhana', 'type': 'father'},
      {'person1': 'gandhari', 'person2': 'duryodhana', 'type': 'mother'},
      {'person1': 'dhritarashtra', 'person2': 'dushasana', 'type': 'father'},
      {'person1': 'gandhari', 'person2': 'dushasana', 'type': 'mother'},

      // Siblings
      {'person1': 'yudhishthira', 'person2': 'bhima', 'type': 'brother'},
      {'person1': 'yudhishthira', 'person2': 'arjuna', 'type': 'brother'},
      {'person1': 'yudhishthira', 'person2': 'nakula', 'type': 'brother'},
      {'person1': 'yudhishthira', 'person2': 'sahadeva', 'type': 'brother'},
      {'person1': 'bhima', 'person2': 'arjuna', 'type': 'brother'},
      {'person1': 'nakula', 'person2': 'sahadeva', 'type': 'twin'},
      {'person1': 'duryodhana', 'person2': 'dushasana', 'type': 'brother'},
      {'person1': 'pandu', 'person2': 'dhritarashtra', 'type': 'brother'},
      {'person1': 'pandu', 'person2': 'vidura', 'type': 'brother'},
    ];

    for (final rel in relationships) {
      await database.into(database.relationshipsTable).insertOnConflictUpdate(
        RelationshipsTableCompanion.insert(
          id: _uuid.v4(),
          treeId: treeId,
          person1Id: persons[rel['person1']]!,
          person2Id: persons[rel['person2']]!,
          type: rel['type']!,
          startDate: Value(DateTime(1050, 1, 1)),
          isConfirmed: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
  }

  static Future<void> _createEvents(AppDatabase database, String treeId, Map<String, String> persons, String userId) async {
    final events = [
      {
        'person': 'bhishma',
        'type': 'vow',
        'title': 'Bhishma\\'s Terrible Vow',
        'description': 'Bhishma takes the vow of celibacy to ensure his father can marry Satyavati.',
        'date': DateTime(1030, 1, 1),
        'location': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
      },
      {
        'person': 'yudhishthira',
        'type': 'coronation',
        'title': 'Coronation as Crown Prince',
        'description': 'Yudhishthira is declared the heir apparent to the throne of Hastinapura.',
        'date': DateTime(1090, 1, 1),
        'location': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
      },
      {
        'person': 'draupadi',
        'type': 'marriage',
        'title': 'Swayamvara of Draupadi',
        'description': 'Draupadi chooses Arjuna in the swayamvara, but ends up marrying all five Pandavas.',
        'date': DateTime(1085, 3, 1),
        'location': {'name': 'Panchala', 'country': 'Bharatvarsha'},
      },
      {
        'person': 'yudhishthira',
        'type': 'defeat',
        'title': 'The Game of Dice',
        'description': 'Yudhishthira loses everything including Draupadi in a rigged game of dice.',
        'date': DateTime(1095, 1, 1),
        'location': {'name': 'Hastinapura', 'country': 'Bharatvarsha'},
      },
      {
        'person': 'arjuna',
        'type': 'war',
        'title': 'Kurukshetra War Begins',
        'description': 'The great 18-day war between Pandavas and Kauravas begins.',
        'date': DateTime(1100, 1, 1),
        'location': {'name': 'Kurukshetra', 'country': 'Bharatvarsha'},
      },
    ];

    for (final event in events) {
      await database.into(database.eventsTable).insertOnConflictUpdate(
        EventsTableCompanion.insert(
          id: _uuid.v4(),
          treeId: treeId,
          primaryPersonId: persons[event['person']]!,
          type: event['type'] as String,
          title: event['title'] as String,
          description: Value(event['description'] as String),
          date: event['date'] as DateTime,
          location: Value(event['location'] as Map<String, dynamic>),
          isPublic: true,
          privacy: 'family',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
  }

  static Future<void> _createStories(AppDatabase database, String treeId, Map<String, String> persons, String userId) async {
    final stories = [
      {
        'title': 'The Vow of Bhishma',
        'content': 'Long ago, King Shantanu fell in love with a beautiful fisherwoman named Satyavati. However, her father would only agree to the marriage if Satyavati\\'s children would inherit the throne. Bhishma, Shantanu\\'s son, made a terrible vow - he would never marry or have children, ensuring that Satyavati\\'s lineage would continue. This selfless act earned him the name "Bhishma" meaning terrible vow.',
        'tags': ['sacrifice', 'duty', 'love', 'vow'],
        'relatedPersons': ['bhishma', 'shantanu', 'satyavati'],
      },
      {
        'title': 'The Birth of the Pandavas',
        'content': 'King Pandu was cursed that he would die if he ever embraced his wives. Unable to have children naturally, his queens Kunti and Madri used divine boons to bear children with the gods. Kunti bore Yudhishthira (with Dharma), Bhima (with Vayu), and Arjuna (with Indra). Madri bore the twins Nakula and Sahadeva (with the Ashwini Kumaras). These five became known as the Pandavas.',
        'tags': ['divine birth', 'curse', 'gods', 'destiny'],
        'relatedPersons': ['pandu', 'kunti', 'madri', 'yudhishthira', 'bhima', 'arjuna', 'nakula', 'sahadeva'],
      },
      {
        'title': 'Krishna\\'s Friendship with Arjuna',
        'content': 'The friendship between Krishna and Arjuna was one of the most beautiful relationships in the Mahabharata. Krishna served as Arjuna\\'s charioteer in the great war, and it was during this time that he spoke the immortal words of the Bhagavad Gita. Their bond transcended the mortal realm, representing the eternal connection between the divine and the devoted.',
        'tags': ['friendship', 'divine', 'guidance', 'bhagavad gita'],
        'relatedPersons': ['krishna', 'arjuna'],
      },
      {
        'title': 'Draupadi\\'s Swayamvara',
        'content': 'Princess Draupadi\\'s swayamvara was a grand event. The challenge was to string a mighty bow and hit a rotating fish target while looking only at its reflection in water below. Many kings failed, but Arjuna, disguised as a brahmin, succeeded. However, when the brothers returned home and Kunti said "share whatever you have brought", Draupadi became wife to all five Pandavas.',
        'tags': ['swayamvara', 'skill', 'marriage', 'destiny'],
        'relatedPersons': ['draupadi', 'arjuna', 'yudhishthira', 'bhima', 'nakula', 'sahadeva'],
      },
      {
        'title': 'The Kurukshetra War',
        'content': 'The great war of Kurukshetra lasted 18 days and involved armies from across the known world. It was fought between the Pandavas and their cousins, the Kauravas, for the throne of Hastinapura. The war resulted in almost complete destruction of the warrior class, with the Pandavas emerging victorious but at a terrible cost. It marked the end of the Dwapara Yuga.',
        'tags': ['war', 'dharma', 'destruction', 'victory'],
        'relatedPersons': ['yudhishthira', 'duryodhana', 'arjuna', 'bhima', 'krishna'],
      },
    ];

    for (final story in stories) {
      await database.into(database.storiesTable).insertOnConflictUpdate(
        StoriesTableCompanion.insert(
          id: _uuid.v4(),
          treeId: treeId,
          authorId: userId,
          title: story['title'] as String,
          content: story['content'] as String,
          tags: story['tags'] as List<String>,
          relatedPersons: story['relatedPersons'] as List<String>,
          status: 'published',
          privacy: 'family',
          publishedAt: Value(DateTime.now()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
  }
}