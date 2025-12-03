import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
// DISABLED: import '../datasources/local/app_database.dart'; // Causes SQLite/Drift build issues
import 'mahabharata_demo_data.dart';

class DemoInitializer {
  static Future<bool> initializeDemoData(WidgetRef ref) async {
    try {
      final authService = ref.read(authServiceProvider);
      final database = ref.read(databaseProvider);

      // Check if demo user already exists
      final existingUser = await database.select(database.usersTable)
          .where((u) => u.email.equals(MahabharataDemoData.demoEmail))
          .getSingleOrNull();

      if (existingUser != null) {
        print('Demo data already exists');
        return true;
      }

      // Create demo data
      await MahabharataDemoData.createDemoData(database);
      print('Demo data created successfully');
      return true;
    } catch (e) {
      print('Failed to create demo data: $e');
      return false;
    }
  }

  static Future<bool> signInWithDemoAccount(WidgetRef ref) async {
    try {
      final authController = ref.read(authControllerProvider.notifier);
      await authController.signInWithEmail(
        email: MahabharataDemoData.demoEmail,
        password: MahabharataDemoData.demoPassword,
      );
      return true;
    } catch (e) {
      print('Failed to sign in with demo account: $e');
      return false;
    }
  }
}

// Provider to access demo functionality
final demoInitializerProvider = Provider<DemoInitializer>((ref) => DemoInitializer());