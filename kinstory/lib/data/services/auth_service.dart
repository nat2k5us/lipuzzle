import 'package:supabase_flutter/supabase_flutter.dart';
// DISABLED: import 'package:drift/drift.dart'; // Causes SQLite/Drift build issues
import '../../core/config/supabase_config.dart';
// DISABLED: import '../datasources/local/app_database.dart'; // Causes SQLite/Drift build issues
import '../datasources/local/mock_database.dart'; // Mock database for UI testing
import '../../domain/entities/user.dart' as domain;

class AuthService {
  final SupabaseClient _supabase = SupabaseConfig.client;
  final MockDatabase _database; // Using mock database for UI testing

  AuthService(this._database);

  // Current user stream
  Stream<User?> get authStateChanges => _supabase.auth.onAuthStateChange.map((event) {
    if (event.event == AuthChangeEvent.signedIn && event.session?.user != null) {
      return event.session!.user;
    }
    return null;
  });

  // Get current user
  User? get currentUser => _supabase.auth.currentUser;

  // Check if user is signed in
  bool get isSignedIn => currentUser != null;

  // Sign up with email and password
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'display_name': '$firstName $lastName',
        },
      );

      if (response.user != null) {
        // DISABLED: Create local user record - uses Drift database operations
        // await _createLocalUserRecord(response.user!, firstName, lastName);
        print('✅ AUTH: User signed up successfully (local user record creation disabled)');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Sign in with email and password
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // DISABLED: Sync local user record - uses Drift database operations
        // await _syncLocalUserRecord(response.user!);
        print('✅ AUTH: User signed in successfully (local sync disabled)');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    try {
      final response = await _supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'com.kinstory.app://auth-callback',
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Sign in with Apple
  Future<bool> signInWithApple() async {
    try {
      final response = await _supabase.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: 'com.kinstory.app://auth-callback',
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Send password reset email
  Future<void> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: 'com.kinstory.app://reset-password',
      );
    } catch (e) {
      rethrow;
    }
  }

  // Update password
  Future<UserResponse> updatePassword(String newPassword) async {
    try {
      final response = await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Update profile
  Future<UserResponse> updateProfile({
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (firstName != null) data['first_name'] = firstName;
      if (lastName != null) data['last_name'] = lastName;
      if (displayName != null) data['display_name'] = displayName;
      if (avatarUrl != null) data['avatar_url'] = avatarUrl;

      final response = await _supabase.auth.updateUser(
        UserAttributes(data: data),
      );

      if (response.user != null) {
        // DISABLED: Sync local user record - uses Drift database operations
        // await _syncLocalUserRecord(response.user!);
        print('✅ AUTH: User profile updated successfully (local sync disabled)');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      // DISABLED: Clear local user data - uses Drift database operations
      // await _database.clearAllData();
      print('✅ AUTH: User signed out successfully (local data clear disabled)');
    } catch (e) {
      rethrow;
    }
  }

  // Delete account
  Future<void> deleteAccount() async {
    try {
      final user = currentUser;
      if (user != null) {
        // DISABLED: Delete local data first - uses Drift database operations
        // await _database.deleteUserData(user.id);
        print('✅ AUTH: Local user data deletion disabled');

        // Call backend function to delete user account
        await _supabase.functions.invoke('delete-user-account');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Get session
  Session? get currentSession => _supabase.auth.currentSession;

  // Refresh session
  Future<AuthResponse> refreshSession() async {
    try {
      return await _supabase.auth.refreshSession();
    } catch (e) {
      rethrow;
    }
  }

  // DISABLED: Create local user record - uses Drift database operations
  /*
  Future<void> _createLocalUserRecord(
    User user,
    String firstName,
    String lastName,
  ) async {
    try {
      final userData = UsersTableCompanion.insert(
        id: user.id,
        email: user.email ?? '',
        firstName: firstName,
        lastName: lastName,
        profilePictureUrl: Value(user.userMetadata?['avatar_url'] as String?),
        preferences: Value(const <String, dynamic>{}),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _database.into(_database.usersTable).insert(userData);
    } catch (e) {
      // User might already exist, update instead
      await _syncLocalUserRecord(user);
    }
  }
  */

  // DISABLED: Sync local user record with remote - uses Drift database operations
  /*
  Future<void> _syncLocalUserRecord(User user) async {
    try {
      final userData = user.userMetadata ?? {};

      await _database.into(_database.usersTable).insertOnConflictUpdate(
        UsersTableCompanion.insert(
          id: user.id,
          email: user.email ?? '',
          firstName: userData['first_name'] as String? ?? '',
          lastName: userData['last_name'] as String? ?? '',
          profilePictureUrl: Value(userData['avatar_url'] as String?),
          updatedAt: DateTime.now(),
          preferences: Value(const <String, dynamic>{}),
          createdAt: DateTime.now(), // This won't be used on update
        ),
      );
    } catch (e) {
      print('Error syncing local user record: $e');
    }
  }
  */

  // Verify email
  Future<AuthResponse> verifyOTP({
    required String email,
    required String token,
    required OtpType type,
  }) async {
    try {
      return await _supabase.auth.verifyOTP(
        email: email,
        token: token,
        type: type,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Resend email verification
  Future<void> resendEmailVerification() async {
    try {
      final user = currentUser;
      if (user?.email != null) {
        await _supabase.auth.resend(
          type: OtpType.signup,
          email: user!.email!,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}