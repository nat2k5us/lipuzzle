import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/config/supabase_config.dart';
import 'core/router/app_router.dart';
import 'data/datasources/local/mock_database.dart';
import 'data/services/flat_json_importer.dart';
import 'data/services/avatar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await SupabaseConfig.initialize();
  await AvatarService().initialize();
  await _seedMockDatabase();

  runApp(
    const ProviderScope(
      child: KinStoryApp(),
    ),
  );
}

class KinStoryApp extends ConsumerWidget {
  const KinStoryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'KinStory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: 'SF Pro Display', // Use system font on iOS
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.family_restroom,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              const SizedBox(height: 32),

              // App Title
              const Text(
                'KinStory',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                'Your family tree, your stories',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 48),

              // Feature highlights
              _FeatureCard(
                icon: Icons.account_tree,
                title: 'Build Your Tree',
                description: 'Create and visualize your family connections',
              ),
              const SizedBox(height: 16),
              _FeatureCard(
                icon: Icons.auto_stories,
                title: 'Share Stories',
                description: 'Preserve memories with AI-assisted storytelling',
              ),
              const SizedBox(height: 16),
              _FeatureCard(
                icon: Icons.group,
                title: 'Collaborate',
                description: 'Work together with family members',
              ),
              const SizedBox(height: 48),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/onboarding');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Sign In Link
              TextButton(
                onPressed: () {
                  context.go('/sign-in');
                },
                child: const Text(
                  'Already have an account? Sign In',
                  style: TextStyle(
                    color: Colors.teal,
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

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.teal,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _seedMockDatabase() async {
  final db = MockDatabase.instance;
  db.reset();

  final jsonString = await rootBundle.loadString('assets/krishna-family-tree-flat.json');
  final importer = FlatJsonImporter(database: db);
  final result = await importer.importFromJson(
    jsonString,
    userId: 'demo-user-123',
    treeId: 'demo-tree-123',
  );

  if (!result.success) {
    throw Exception('Failed to import Krishna family tree: ${result.message}');
  }

  print('✅ Imported ${result.personsImported} persons and ${result.relationshipsImported} relationships');

  db.markInitialized();
}
