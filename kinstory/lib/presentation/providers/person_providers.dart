import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/mock_database.dart';
import '../../data/services/avatar_service.dart';
import 'auth_providers.dart';

// Provider for getting all persons in the current user's main tree
final personsProvider = FutureProvider<List<MockPerson>>((ref) async {
  final database = ref.read(databaseProvider);
  final currentUser = ref.read(currentUserProvider);

  if (currentUser == null) {
    return [];
  }

  // For demo, use the main demo tree
  final persons = database.getPersonsByTreeId('demo-tree-123');
  return persons;
});

// Provider for getting a specific person by ID
final personProvider = FutureProvider.family<MockPerson?, String>((ref, personId) async {
  final database = ref.read(databaseProvider);
  final persons = await ref.read(personsProvider.future);

  try {
    return persons.firstWhere((person) => person.id == personId);
  } catch (e) {
    return null;
  }
});

// Person form state for creating/editing persons
class PersonFormState {
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final String? birthPlace;
  final DateTime? deathDate;
  final String? deathPlace;
  final String gender;
  final String? bio;
  final bool isLoading;
  final String? error;

  PersonFormState({
    this.firstName = '',
    this.lastName = '',
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.deathPlace,
    this.gender = 'male',
    this.bio,
    this.isLoading = false,
    this.error,
  });

  PersonFormState copyWith({
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    String? birthPlace,
    DateTime? deathDate,
    String? deathPlace,
    String? gender,
    String? bio,
    bool? isLoading,
    String? error,
  }) {
    return PersonFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
      deathDate: deathDate ?? this.deathDate,
      deathPlace: deathPlace ?? this.deathPlace,
      gender: gender ?? this.gender,
      bio: bio ?? this.bio,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Person form controller
class PersonFormController extends StateNotifier<PersonFormState> {
  final MockDatabase _database;
  final Ref _ref;

  PersonFormController(this._database, this._ref) : super(PersonFormState());

  void updateFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateBirthDate(DateTime? birthDate) {
    state = state.copyWith(birthDate: birthDate);
  }

  void updateBirthPlace(String? birthPlace) {
    state = state.copyWith(birthPlace: birthPlace);
  }

  void updateDeathDate(DateTime? deathDate) {
    state = state.copyWith(deathDate: deathDate);
  }

  void updateDeathPlace(String? deathPlace) {
    state = state.copyWith(deathPlace: deathPlace);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void updateBio(String? bio) {
    state = state.copyWith(bio: bio);
  }

  void loadPersonData(MockPerson person) {
    state = PersonFormState(
      firstName: person.firstName,
      lastName: person.lastName ?? '',
      birthDate: person.birthDate,
      birthPlace: person.birthPlace,
      deathDate: person.deathDate,
      deathPlace: person.deathPlace,
      gender: person.gender,
      bio: person.bio,
    );
  }

  Future<bool> savePerson({String? existingPersonId}) async {
    if (state.firstName.isEmpty || state.lastName.isEmpty) {
      state = state.copyWith(error: 'First name and last name are required');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final now = DateTime.now();
      final personId = existingPersonId ?? 'person-${now.millisecondsSinceEpoch}';

      // Get avatar URL using AvatarService (checks for custom images first)
      final avatarUrl = AvatarService().getAvatarUrl(
        firstName: state.firstName,
        lastName: state.lastName,
        gender: state.gender,
      );

      final person = MockPerson(
        id: personId,
        firstName: state.firstName,
        lastName: state.lastName,
        birthDate: state.birthDate,
        birthPlace: state.birthPlace,
        deathDate: state.deathDate,
        deathPlace: state.deathPlace,
        gender: state.gender,
        bio: state.bio,
        treeId: 'demo-tree-123',
        createdAt: existingPersonId != null ? now : now,
        updatedAt: now,
        customFields: const {},
        avatarUrl: avatarUrl,
      );

      if (existingPersonId != null) {
        // For editing - remove old and add new (simple approach for mock database)
        _database.removePerson(existingPersonId);
      }

      _database.addPerson(person);

      // Refresh the persons provider
      _ref.invalidate(personsProvider);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to save person: $e'
      );
      return false;
    }
  }

  void clearForm() {
    state = PersonFormState();
  }
}

// Provider for person form controller
final personFormControllerProvider = StateNotifierProvider<PersonFormController, PersonFormState>((ref) {
  final database = ref.read(databaseProvider);
  return PersonFormController(database, ref);
});

// Search functionality
final personSearchProvider = StateProvider<String>((ref) => '');

// Filtered persons based on search
final filteredPersonsProvider = Provider<AsyncValue<List<MockPerson>>>((ref) {
  final searchQuery = ref.watch(personSearchProvider);
  final personsAsync = ref.watch(personsProvider);

  return personsAsync.when(
    data: (persons) {
      if (searchQuery.isEmpty) {
        return AsyncValue.data(persons);
      }

      final filteredPersons = persons.where((person) {
        final fullName = '${person.firstName} ${person.lastName}'.toLowerCase();
        return fullName.contains(searchQuery.toLowerCase()) ||
               person.birthPlace?.toLowerCase().contains(searchQuery.toLowerCase()) == true;
      }).toList();

      return AsyncValue.data(filteredPersons);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
  );
});

// Person statistics
final personStatsProvider = Provider<Map<String, int>>((ref) {
  final personsAsync = ref.watch(personsProvider);

  return personsAsync.when(
    data: (persons) {
      final stats = <String, int>{
        'total': persons.length,
        'male': persons.where((p) => p.gender == 'male').length,
        'female': persons.where((p) => p.gender == 'female').length,
        'living': persons.where((p) => p.deathDate == null).length,
        'deceased': persons.where((p) => p.deathDate != null).length,
      };
      return stats;
    },
    loading: () => <String, int>{},
    error: (_, __) => <String, int>{},
  );
});
