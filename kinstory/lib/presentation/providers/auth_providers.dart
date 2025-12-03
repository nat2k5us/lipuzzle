import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../../data/services/auth_service.dart';
// DISABLED: import '../../data/datasources/local/app_database.dart'; // Causes SQLite/Drift build issues
import '../../data/datasources/local/mock_database.dart'; // Mock database for UI testing
import '../../domain/entities/user.dart';

// Mock Database provider (replacing SQLite/Drift to fix build issues)
final databaseProvider = Provider<MockDatabase>((ref) {
  return MockDatabase.instance;
});

// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  final database = ref.read(databaseProvider);
  return AuthService(database);
});

// Current user stream provider
final authStateProvider = StreamProvider<supabase.User?>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChanges.cast<supabase.User?>();
});

// Demo user factory for development/testing
supabase.User _createDemoUser() {
  return supabase.User(
    id: 'demo-user-123',
    appMetadata: const {
      'provider': 'demo',
      'providers': ['demo'],
    },
    userMetadata: const {
      'first_name': 'Veda',
      'last_name': 'Vyasa',
      'display_name': 'Veda Vyasa',
    },
    aud: 'authenticated',
    createdAt: DateTime.now().toIso8601String(),
    email: 'demo@mahabharata.com',
    emailConfirmedAt: DateTime.now().toIso8601String(),
  );
}

// Current user provider with auto-demo initialization
final currentUserProvider = StateProvider<supabase.User?>((ref) {
  final authService = ref.read(authServiceProvider);

  // Check if we have a real Supabase user
  final supabaseUser = authService.currentUser;
  if (supabaseUser != null) {
    return supabaseUser;
  }

  // For demo purposes, automatically initialize demo user
  // This allows direct URL navigation to work
  final demoUser = _createDemoUser();
  print('🎭 AUTO-DEMO: Initialized demo user for direct navigation');
  return demoUser;
});

// DISABLED: Local user data provider - uses complex Drift database queries
// This is disabled to fix SQLite/Drift build issues. Can be re-enabled when using real database.
/*
final localUserProvider = FutureProvider.family<User?, String>((ref, userId) async {
  final database = ref.read(databaseProvider);

  try {
    final userData = await (database.select(database.usersTable)
          ..where((u) => u.id.equals(userId)))
        .getSingleOrNull();

    if (userData == null) return null;

    return User(
      id: userData.id,
      email: userData.email,
      firstName: userData.firstName,
      lastName: userData.lastName,
      profilePictureUrl: userData.profilePictureUrl,
      phoneNumber: userData.phoneNumber,
      dateOfBirth: userData.dateOfBirth,
      preferences: UserPreferences.fromJson(userData.preferences),
      emailVerified: userData.emailVerified,
      createdAt: userData.createdAt,
      updatedAt: userData.updatedAt,
      deletedAt: userData.deletedAt,
      lastLoginAt: userData.lastLoginAt,
    );
  } catch (e) {
    return null;
  }
});
*/

// Authentication loading state
final authLoadingProvider = StateProvider<bool>((ref) => false);

// Authentication error state
final authErrorProvider = StateProvider<String?>((ref) => null);

// Authentication controller
class AuthController extends StateNotifier<AsyncValue<supabase.User?>> {
  final AuthService _authService;

  AuthController(this._authService) : super(const AsyncValue.loading()) {
    // Initialize with current user state
    state = _authService.currentUser != null
        ? AsyncValue.data(_authService.currentUser)
        : const AsyncValue.data(null);
  }

  // Sign up
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authService.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      state = AsyncValue.data(response.user);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Sign in
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authService.signInWithEmail(
        email: email,
        password: password,
      );
      state = AsyncValue.data(response.user);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signInWithGoogle();
      // State will be updated by auth state changes stream
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Sign in with Apple
  Future<void> signInWithApple() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signInWithApple();
      // State will be updated by auth state changes stream
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Sign out
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signOut();
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _authService.resetPassword(email);
    } catch (e) {
      rethrow;
    }
  }

  // Update profile
  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
  }) async {
    try {
      final response = await _authService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        displayName: displayName,
        avatarUrl: avatarUrl,
      );
      state = AsyncValue.data(response.user);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Update password
  Future<void> updatePassword(String newPassword) async {
    try {
      await _authService.updatePassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }

  // Delete account
  Future<void> deleteAccount() async {
    try {
      await _authService.deleteAccount();
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Verify email
  Future<void> verifyOTP({
    required String email,
    required String token,
    required supabase.OtpType type,
  }) async {
    try {
      final response = await _authService.verifyOTP(
        email: email,
        token: token,
        type: type,
      );
      state = AsyncValue.data(response.user);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Resend email verification
  Future<void> resendEmailVerification() async {
    try {
      await _authService.resendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }
}

// Auth controller provider
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<supabase.User?>>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthController(authService);
});

// Convenience provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    data: (user) => user != null,
    orElse: () => false,
  );
});

// User ID provider
final userIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    data: (user) => user?.id,
    orElse: () => null,
  );
});

// Email verification status provider
final isEmailVerifiedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    data: (user) => user?.emailConfirmedAt != null,
    orElse: () => false,
  );
});
