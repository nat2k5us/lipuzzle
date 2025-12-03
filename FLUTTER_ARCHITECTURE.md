# KinStory - Flutter Architecture & Technical Design

## Overview

This document outlines the technical architecture for KinStory mobile app built with Flutter, targeting iOS and Android platforms.

---

## 1. Technology Stack

### 1.1 Core Framework

**Flutter SDK**
- **Version**: Flutter 3.19+ (stable channel)
- **Dart**: 3.3+
- **Target Platforms**: iOS 15+, Android 8.0+ (API 26)

**Why Flutter?**
- ✅ Single codebase for iOS and Android
- ✅ Rich, custom UI needed for tree visualization
- ✅ Excellent performance for complex layouts
- ✅ Strong community and ecosystem
- ✅ Hot reload for rapid development
- ✅ Good AR support (ARCore/ARKit plugins)
- ✅ Mature state management options
- ⚠️ Trade-off: Some platform-specific features require native plugins

### 1.2 State Management

**Primary: Riverpod 2.x**

```dart
// Why Riverpod?
// - Compile-time safety
// - No BuildContext required
// - Excellent testability
// - Family support for parameterized providers
// - AsyncValue for loading states
// - Auto-dispose and lifecycle management
```

**Alternatives Considered**:
- ❌ **Provider**: Less type-safe, older pattern
- ❌ **Bloc**: Too verbose for our use case
- ✅ **Riverpod**: Best balance of power and simplicity

**State Architecture**:
```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Widgets, UI Components, Screens)      │
└─────────────────┬───────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│      Application Layer (Providers)      │
│  - StateNotifierProvider (mutable)      │
│  - FutureProvider (async data)          │
│  - StreamProvider (real-time)           │
└─────────────────┬───────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│         Domain Layer (Models)           │
│  - Entities (Person, Tree, Story)       │
│  - Use Cases (Business Logic)           │
└─────────────────┬───────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│         Data Layer                      │
│  - Repositories (Interface)             │
│  - Data Sources (Local, Remote)         │
└─────────────────────────────────────────┘
```

### 1.3 Backend & API

**Backend Options**:

**Option A: Supabase (Recommended for MVP)**
- PostgreSQL database
- Built-in authentication
- Real-time subscriptions
- Storage for media
- Row-level security
- Free tier generous for MVP

**Option B: Custom Backend**
- Node.js + NestJS + PostgreSQL
- GraphQL API
- More control, more complexity

**API Client**:
```dart
// For Supabase
dependencies:
  supabase_flutter: ^2.0.0

// For GraphQL (if custom backend)
dependencies:
  graphql_flutter: ^5.1.0
```

### 1.4 Local Database (Offline-First)

**Drift (formerly Moor)**
```dart
dependencies:
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.0
  path: ^1.8.3
```

**Why Drift?**
- ✅ Type-safe SQL queries
- ✅ Reactive queries (Stream support)
- ✅ Built-in migration support
- ✅ Excellent performance
- ✅ Works with Riverpod

**Schema Design** (mirrors server):
```dart
@DataClassName('PersonData')
class Persons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serverId => text().nullable()();
  IntColumn get treeId => integer()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  DateTimeColumn get dateOfDeath => dateTime().nullable()();
  BoolColumn get isLiving => boolean().withDefault(const Constant(true))();
  TextColumn get biography => text().nullable()();
  TextColumn get customFields => text().map(const JsonTypeConverter()).nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get syncPending => boolean().withDefault(const Constant(false))();
}
```

### 1.5 Navigation

**go_router 13.x**
```dart
dependencies:
  go_router: ^13.0.0
```

**Why go_router?**
- ✅ Declarative routing
- ✅ Deep linking support
- ✅ Type-safe navigation
- ✅ Guards for auth/permissions
- ✅ Works well with Riverpod

**Route Structure**:
```
/
├── /auth
│   ├── /login
│   └── /signup
├── /onboarding
├── /trees
│   └── /trees/:treeId
│       ├── /person/:personId
│       ├── /edit/:personId
│       ├── /story/:personId
│       └── /interview/:personId
├── /settings
└── /kids
```

### 1.6 UI Framework & Design

**Material Design 3**
```dart
dependencies:
  flutter: sdk
  # Material 3 built-in
```

**Cupertino Widgets** (iOS-specific where appropriate)

**Custom Design System**:
```dart
// lib/design/
├── colors.dart        // Brand colors
├── typography.dart    // Text styles
├── spacing.dart       // Layout constants
├── components/        // Reusable widgets
│   ├── buttons.dart
│   ├── cards.dart
│   ├── inputs.dart
│   └── avatars.dart
└── theme.dart         // ThemeData
```

### 1.7 Visualization & Graphics

**For Family Tree Rendering**:

**Option A: Flutter Custom Painter + Canvas**
```dart
// Pros: Full control, performant
// Cons: More work
class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw nodes, connections, etc.
  }
}
```

**Option B: graphview Package**
```dart
dependencies:
  graphview: ^1.2.0

// Pros: Pre-built graph layouts
// Cons: Less control over styling
```

**For Interactive Charts**:
```dart
dependencies:
  fl_chart: ^0.66.0  // For timeline, statistics
```

**For Maps**:
```dart
dependencies:
  google_maps_flutter: ^2.5.0
  # or
  flutter_map: ^6.0.0  # Open source alternative
```

### 1.8 Media & Files

**Image Handling**:
```dart
dependencies:
  cached_network_image: ^3.3.0  # Cached images
  image_picker: ^1.0.0           # Camera/gallery
  image_cropper: ^5.0.0          # Crop images
  flutter_image_compress: ^2.1.0 # Optimize uploads
```

**Video**:
```dart
dependencies:
  video_player: ^2.8.0
  chewie: ^1.7.0  # Better video player UI
```

**File Storage**:
```dart
dependencies:
  path_provider: ^2.1.0   # Local directories
  file_picker: ^6.1.0     # Document picker
```

### 1.9 AR Features

```dart
dependencies:
  ar_flutter_plugin: ^0.7.0
  # or
  arcore_flutter_plugin: ^0.1.0  # Android
  arkit_plugin: ^1.0.7            # iOS
```

### 1.10 Audio Recording & Playback

```dart
dependencies:
  record: ^5.0.0              # Audio recording
  audioplayers: ^5.2.0        # Playback
  just_audio: ^0.9.0          # Advanced playback
  permission_handler: ^11.0.0 # Microphone permissions
```

### 1.11 AI & ML

**Speech-to-Text** (On-device):
```dart
dependencies:
  speech_to_text: ^6.5.0
```

**AI Story Generation** (Server-side):
```dart
// Call backend API with OpenAI/Claude
// Or use Google AI (Gemini) via API
dependencies:
  google_generative_ai: ^0.2.0
```

**Image Processing** (On-device):
```dart
dependencies:
  google_mlkit_face_detection: ^0.9.0  # Face detection
  google_mlkit_text_recognition: ^0.11.0  # OCR for documents
```

### 1.12 Sync & Real-Time

**For Supabase**:
```dart
// Built-in real-time subscriptions
final subscription = supabase
  .from('persons')
  .stream(primaryKey: ['id'])
  .eq('tree_id', treeId)
  .listen((data) {
    // Handle updates
  });
```

**For Custom Backend**:
```dart
dependencies:
  web_socket_channel: ^2.4.0
```

### 1.13 Authentication

**Supabase Auth**:
```dart
// Email/password
await supabase.auth.signUp(
  email: email,
  password: password,
);

// OAuth (Google, Apple)
await supabase.auth.signInWithOAuth(OAuthProvider.google);
```

**Biometric Auth**:
```dart
dependencies:
  local_auth: ^2.1.0
```

### 1.14 Analytics & Monitoring

```dart
dependencies:
  firebase_analytics: ^10.7.0
  firebase_crashlytics: ^3.4.0
  sentry_flutter: ^7.14.0  # Alternative to Crashlytics
```

### 1.15 Testing

```dart
dev_dependencies:
  flutter_test: sdk
  mocktail: ^1.0.0           # Mocking
  integration_test: sdk      # E2E tests
  patrol: ^3.0.0             # Better E2E testing
```

---

## 2. Project Structure

```
kinstory/
├── android/                  # Android native code
├── ios/                      # iOS native code
├── lib/
│   ├── main.dart            # App entry point
│   ├── app.dart             # MaterialApp + routing
│   │
│   ├── core/                # Core utilities
│   │   ├── constants/
│   │   ├── errors/
│   │   ├── utils/
│   │   └── extensions/
│   │
│   ├── config/              # App configuration
│   │   ├── env.dart
│   │   ├── router.dart
│   │   └── theme.dart
│   │
│   ├── data/                # Data layer
│   │   ├── models/          # Data models (JSON)
│   │   ├── repositories/    # Repository implementations
│   │   ├── datasources/
│   │   │   ├── local/       # Local DB (Drift)
│   │   │   └── remote/      # API clients
│   │   └── sync/            # Sync engine
│   │
│   ├── domain/              # Business logic
│   │   ├── entities/        # Domain models
│   │   ├── repositories/    # Repository interfaces
│   │   └── usecases/        # Business use cases
│   │
│   ├── presentation/        # UI layer
│   │   ├── providers/       # Riverpod providers
│   │   ├── screens/         # Full screens
│   │   │   ├── auth/
│   │   │   ├── onboarding/
│   │   │   ├── tree/
│   │   │   ├── person/
│   │   │   ├── story/
│   │   │   ├── kids/
│   │   │   └── settings/
│   │   ├── widgets/         # Reusable widgets
│   │   │   ├── common/
│   │   │   ├── tree/
│   │   │   └── media/
│   │   └── theme/           # Theme & design system
│   │
│   ├── services/            # App services
│   │   ├── auth_service.dart
│   │   ├── sync_service.dart
│   │   ├── storage_service.dart
│   │   ├── ai_service.dart
│   │   └── analytics_service.dart
│   │
│   └── l10n/                # Localization
│       ├── app_en.arb
│       ├── app_es.arb
│       └── app_zh.arb
│
├── test/                     # Unit tests
├── integration_test/         # Integration tests
├── assets/                   # Static assets
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── pubspec.yaml
└── README.md
```

---

## 3. Architecture Patterns

### 3.1 Clean Architecture Layers

```
┌──────────────────────────────────────────────┐
│         Presentation Layer                   │
│  - UI (Widgets)                              │
│  - State Management (Providers)              │
│  - ViewModels                                │
└──────────────┬───────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────┐
│         Domain Layer                         │
│  - Entities (core business objects)          │
│  - Use Cases (business logic)                │
│  - Repository Interfaces                     │
└──────────────┬───────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────┐
│         Data Layer                           │
│  - Repository Implementations                │
│  - Data Sources (Local DB, Remote API)       │
│  - Models (DTOs)                             │
│  - Mappers (Model ↔ Entity)                  │
└──────────────────────────────────────────────┘
```

**Key Principles**:
- Domain layer has **no dependencies** on other layers
- Data layer depends on Domain (implements interfaces)
- Presentation depends on Domain (uses entities & use cases)
- Dependencies point **inward** (toward domain)

### 3.2 Example: Person Feature

```dart
// ===== DOMAIN LAYER =====

// Entity (domain/entities/person.dart)
class Person {
  final String id;
  final String firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final bool isLiving;

  Person({
    required this.id,
    required this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.isLiving = true,
  });
}

// Repository Interface (domain/repositories/person_repository.dart)
abstract class PersonRepository {
  Future<List<Person>> getPersonsInTree(String treeId);
  Future<Person> getPersonById(String id);
  Future<Person> createPerson(Person person);
  Future<Person> updatePerson(Person person);
  Future<void> deletePerson(String id);
  Stream<List<Person>> watchPersonsInTree(String treeId);
}

// Use Case (domain/usecases/get_persons_in_tree.dart)
class GetPersonsInTree {
  final PersonRepository repository;

  GetPersonsInTree(this.repository);

  Future<List<Person>> call(String treeId) {
    return repository.getPersonsInTree(treeId);
  }
}

// ===== DATA LAYER =====

// Model (data/models/person_model.dart)
@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    required String id,
    required String firstName,
    String? lastName,
    DateTime? dateOfBirth,
    @Default(true) bool isLiving,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

// Extension to map Model ↔ Entity
extension PersonModelX on PersonModel {
  Person toEntity() => Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        isLiving: isLiving,
      );
}

extension PersonEntityX on Person {
  PersonModel toModel() => PersonModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        isLiving: isLiving,
      );
}

// Repository Implementation (data/repositories/person_repository_impl.dart)
class PersonRepositoryImpl implements PersonRepository {
  final PersonLocalDataSource localDataSource;
  final PersonRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Person>> getPersonsInTree(String treeId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePersons = await remoteDataSource.getPersonsInTree(treeId);
        await localDataSource.cachePersons(remotePersons);
        return remotePersons.map((m) => m.toEntity()).toList();
      } catch (e) {
        // Fallback to local
        final localPersons = await localDataSource.getPersonsInTree(treeId);
        return localPersons.map((m) => m.toEntity()).toList();
      }
    } else {
      final localPersons = await localDataSource.getPersonsInTree(treeId);
      return localPersons.map((m) => m.toEntity()).toList();
    }
  }

  @override
  Stream<List<Person>> watchPersonsInTree(String treeId) {
    return localDataSource
        .watchPersonsInTree(treeId)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  // ... other methods
}

// ===== PRESENTATION LAYER =====

// Provider (presentation/providers/person_provider.dart)
@riverpod
Future<List<Person>> personsInTree(
  PersonsInTreeRef ref,
  String treeId,
) async {
  final repository = ref.watch(personRepositoryProvider);
  return repository.getPersonsInTree(treeId);
}

@riverpod
class PersonNotifier extends _$PersonNotifier {
  @override
  Person? build(String personId) {
    // Load person
    return null;
  }

  Future<void> updatePerson(Person person) async {
    final repository = ref.read(personRepositoryProvider);
    final updated = await repository.updatePerson(person);
    state = updated;
  }
}

// Widget (presentation/screens/tree/tree_screen.dart)
class TreeScreen extends ConsumerWidget {
  final String treeId;

  const TreeScreen({required this.treeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personsAsync = ref.watch(personsInTreeProvider(treeId));

    return personsAsync.when(
      data: (persons) => TreeView(persons: persons),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => ErrorView(error: error),
    );
  }
}
```

### 3.3 Offline-First Sync Strategy

**Sync Architecture**:

```dart
// Sync operation model
class SyncOperation {
  final String id;
  final OperationType type; // create, update, delete
  final String entityType;  // person, relationship, story
  final String entityId;
  final Map<String, dynamic> data;
  final DateTime createdAt;
  final int retryCount;

  SyncOperation({...});
}

enum OperationType { create, update, delete }

// Sync queue
class SyncQueue {
  final Database db;

  Future<void> enqueue(SyncOperation op) async {
    await db.into(db.syncOperations).insert(op.toCompanion());
  }

  Stream<List<SyncOperation>> watchPending() {
    return (db.select(db.syncOperations)
          ..where((t) => t.syncedAt.isNull()))
        .watch();
  }

  Future<void> markSynced(String opId) async {
    await (db.update(db.syncOperations)
          ..where((t) => t.id.equals(opId)))
        .write(SyncOperationsCompanion(
          syncedAt: Value(DateTime.now()),
        ));
  }
}

// Sync service
class SyncService {
  final SyncQueue queue;
  final ApiClient api;
  Timer? _syncTimer;

  void startPeriodicSync() {
    _syncTimer = Timer.periodic(Duration(minutes: 5), (_) {
      syncPendingOperations();
    });
  }

  Future<void> syncPendingOperations() async {
    final pending = await queue.getPending();

    for (final op in pending) {
      try {
        switch (op.type) {
          case OperationType.create:
            await api.create(op.entityType, op.data);
            break;
          case OperationType.update:
            await api.update(op.entityType, op.entityId, op.data);
            break;
          case OperationType.delete:
            await api.delete(op.entityType, op.entityId);
            break;
        }
        await queue.markSynced(op.id);
      } catch (e) {
        // Increment retry count, handle errors
        await queue.incrementRetry(op.id);
      }
    }
  }
}
```

**Conflict Resolution**:

```dart
class ConflictResolver {
  Future<Person> resolve(Person local, Person remote) async {
    // Strategy: Last-write-wins based on updatedAt
    if (local.updatedAt.isAfter(remote.updatedAt)) {
      // Local is newer - keep local, push to server
      return local;
    } else {
      // Remote is newer - accept remote
      return remote;
    }

    // For critical conflicts, store both and show UI for user decision
  }
}
```

---

## 4. Key Technical Considerations

### 4.1 Performance Optimization

**Large Tree Rendering**:
```dart
// Use ListView.builder for large lists
ListView.builder(
  itemCount: persons.length,
  itemBuilder: (context, index) {
    return PersonTile(person: persons[index]);
  },
);

// For tree view, use custom painter with viewport culling
class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Only draw nodes within viewport
    final visibleNodes = nodes.where((n) =>
      n.position.dx >= -nodeWidth &&
      n.position.dx <= size.width + nodeWidth &&
      n.position.dy >= -nodeHeight &&
      n.position.dy <= size.height + nodeHeight
    );

    for (final node in visibleNodes) {
      drawNode(canvas, node);
    }
  }
}
```

**Image Optimization**:
```dart
// Resize before upload
final resized = await FlutterImageCompress.compressWithFile(
  file.path,
  minWidth: 1920,
  minHeight: 1080,
  quality: 85,
);

// Use cached network images
CachedNetworkImage(
  imageUrl: person.photoUrl,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
  memCacheWidth: 400, // Limit memory usage
);
```

**Database Indexing**:
```dart
@override
List<Index> get indexes => [
  Index('tree_id_idx', 'CREATE INDEX tree_id_idx ON persons(tree_id)'),
  Index('name_idx', 'CREATE INDEX name_idx ON persons(last_name, first_name)'),
];
```

### 4.2 Security

**Secure Storage**:
```dart
dependencies:
  flutter_secure_storage: ^9.0.0

final storage = FlutterSecureStorage();

// Store auth tokens
await storage.write(key: 'auth_token', value: token);

// Store encryption keys
await storage.write(key: 'encryption_key', value: key);
```

**Encryption**:
```dart
dependencies:
  encrypt: ^5.0.0

// Encrypt sensitive data before storing
final key = Key.fromSecureRandom(32);
final iv = IV.fromSecureRandom(16);
final encrypter = Encrypter(AES(key));

final encrypted = encrypter.encrypt(plainText, iv: iv);
final decrypted = encrypter.decrypt(encrypted, iv: iv);
```

**Certificate Pinning**:
```dart
dependencies:
  dio: ^5.4.0

final dio = Dio();

// Pin SSL certificate
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    (client) {
  client.badCertificateCallback =
      (X509Certificate cert, String host, int port) {
    return cert.sha1.toString() == expectedSha1;
  };
  return client;
};
```

### 4.3 Accessibility

```dart
// Use Semantics widget
Semantics(
  label: 'Profile photo of ${person.firstName}',
  child: Image.network(person.photoUrl),
);

// Support text scaling
Text(
  person.name,
  style: Theme.of(context).textTheme.titleLarge,
  // Automatically scales with system settings
);

// Minimum touch targets
SizedBox(
  width: 48,
  height: 48,
  child: IconButton(
    icon: Icon(Icons.edit),
    onPressed: () {},
  ),
);
```

### 4.4 Internationalization

```dart
// pubspec.yaml
flutter:
  generate: true

// l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart

// Usage
Text(AppLocalizations.of(context)!.welcomeMessage)

// With parameters
Text(AppLocalizations.of(context)!.personCount(count))
```

---

## 5. Platform-Specific Considerations

### 5.1 iOS

**Required Info.plist Entries**:
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to attach family photos</string>

<key>NSCameraUsageDescription</key>
<string>We need camera access to take photos of family members</string>

<key>NSMicrophoneUsageDescription</key>
<string>We need microphone access to record family stories</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>We use your location to tag where events happened</string>
```

**Sign in with Apple** (Required if using social login):
```dart
dependencies:
  sign_in_with_apple: ^5.0.0
```

**ARKit Support**:
```dart
dependencies:
  arkit_plugin: ^1.0.7

// Check ARKit availability
final isARSupported = await ARKitController.checkIsARSupported();
```

### 5.2 Android

**Permissions** (AndroidManifest.xml):
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.RECORD_AUDIO"/>

<!-- For ARCore -->
<uses-feature android:name="android.hardware.camera.ar" android:required="true"/>
```

**ARCore Support**:
```dart
dependencies:
  arcore_flutter_plugin: ^0.1.0
```

---

## 6. CI/CD Pipeline

### 6.1 GitHub Actions Workflow

```yaml
name: Flutter CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test

  build-ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --release --no-codesign

  build-android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
      - run: flutter build appbundle --release
```

### 6.2 Fastlane Setup

**iOS** (fastlane/Fastfile):
```ruby
lane :beta do
  build_app(scheme: "Runner")
  upload_to_testflight
end

lane :release do
  build_app(scheme: "Runner")
  upload_to_app_store
end
```

**Android**:
```ruby
lane :beta do
  gradle(task: "bundle", build_type: "Release")
  upload_to_play_store(track: "internal")
end

lane :release do
  gradle(task: "bundle", build_type: "Release")
  upload_to_play_store
end
```

---

## 7. Testing Strategy

### 7.1 Unit Tests

```dart
// test/domain/usecases/get_persons_in_tree_test.dart
void main() {
  late MockPersonRepository mockRepository;
  late GetPersonsInTree usecase;

  setUp(() {
    mockRepository = MockPersonRepository();
    usecase = GetPersonsInTree(mockRepository);
  });

  test('should get persons from repository', () async {
    // Arrange
    final treeId = '123';
    final persons = [Person(id: '1', firstName: 'John')];
    when(() => mockRepository.getPersonsInTree(treeId))
        .thenAnswer((_) async => persons);

    // Act
    final result = await usecase(treeId);

    // Assert
    expect(result, persons);
    verify(() => mockRepository.getPersonsInTree(treeId)).called(1);
  });
}
```

### 7.2 Widget Tests

```dart
// test/presentation/widgets/person_tile_test.dart
void main() {
  testWidgets('PersonTile displays person name', (tester) async {
    final person = Person(id: '1', firstName: 'John', lastName: 'Doe');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PersonTile(person: person),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
  });
}
```

### 7.3 Integration Tests

```dart
// integration_test/app_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('full onboarding flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Tap "Get Started"
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Enter name
    await tester.enterText(find.byKey(Key('firstName')), 'John');
    await tester.enterText(find.byKey(Key('lastName')), 'Doe');

    // Submit
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Verify navigation to tree view
    expect(find.byType(TreeScreen), findsOneWidget);
  });
}
```

---

## 8. Deployment Checklist

### 8.1 Pre-Launch

- [ ] All critical user flows tested
- [ ] App Store Connect / Play Console accounts set up
- [ ] Privacy policy & terms of service finalized
- [ ] App icons & screenshots prepared
- [ ] Store listings written (title, description, keywords)
- [ ] Age rating determined
- [ ] In-app purchases configured (if applicable)
- [ ] Analytics & crash reporting enabled
- [ ] Backend deployed and tested
- [ ] Database backups configured
- [ ] CDN configured for media
- [ ] App signing certificates ready

### 8.2 iOS Specific

- [ ] Bundle identifier registered
- [ ] Provisioning profiles generated
- [ ] Push notification certificates configured
- [ ] App Store Connect app created
- [ ] TestFlight beta testing complete
- [ ] App Store review guidelines compliance checked
- [ ] Sign in with Apple implemented (if using social login)

### 8.3 Android Specific

- [ ] Package name registered
- [ ] Keystore file created and backed up
- [ ] Play Console app created
- [ ] Internal testing track deployed
- [ ] Data safety form completed
- [ ] Content rating questionnaire completed
- [ ] Target API level meets requirements

---

## 9. Monitoring & Analytics

### 9.1 Key Metrics to Track

**User Behavior**:
- Screen views
- User flows (onboarding completion, tree creation, etc.)
- Feature usage (stories, photos, AR mode, kids mode)
- Time spent per session
- Actions per session

**Performance**:
- App start time
- Screen rendering time
- API response times
- Crash-free users percentage
- ANR (Application Not Responding) rate

**Business**:
- User retention (D1, D7, D30)
- Viral coefficient (invites sent/accepted)
- Content creation (persons added, stories created)
- Engagement (DAU/MAU)

### 9.2 Implementation

```dart
// Analytics service
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logScreenView(String screenName) async {
    await _analytics.logScreenView(screenName: screenName);
  }

  Future<void> logEvent(String name, Map<String, dynamic>? parameters) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}

// Usage
final analytics = ref.read(analyticsServiceProvider);
await analytics.logEvent('person_created', {
  'tree_id': treeId,
  'has_photo': person.photoUrl != null,
});
```

---

## 10. Next Steps

1. **Set up development environment**
   - Install Flutter SDK
   - Configure IDEs (VS Code / Android Studio)
   - Set up emulators/simulators

2. **Initialize project**
   - Create Flutter project
   - Set up folder structure
   - Configure dependencies

3. **Set up backend**
   - Create Supabase project
   - Design database schema
   - Configure auth providers

4. **Implement core features** (see IMPLEMENTATION_ROADMAP.md)

5. **Begin testing**
   - Write tests alongside features
   - Set up CI/CD early

---

**Document Version**: 1.0
**Last Updated**: 2025-11-15
**Owner**: Engineering Team
**Status**: Draft for Review
