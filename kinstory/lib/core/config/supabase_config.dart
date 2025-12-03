import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String _supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://demo.localhost.invalid',
  );

  static const String _supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'demo-anon-key-not-used-in-demo-mode',
  );

  static SupabaseClient? _client;
  static bool _offlineFallback = false;

  static bool get _hasRealCredentials {
    final url = _supabaseUrl.trim().toLowerCase();
    final anonKey = _supabaseAnonKey.trim().toLowerCase();
    final isPlaceholderUrl =
        url.isEmpty || url.contains('demo.localhost.invalid');
    final isPlaceholderKey = anonKey.isEmpty ||
        anonKey.contains('demo-anon-key-not-used-in-demo-mode');
    return !(isPlaceholderUrl || isPlaceholderKey);
  }

  static Future<void> initialize() async {
    if (_client != null) {
      return;
    }

    debugPrint('🔌 SUPABASE INIT: Starting initialization...');
    debugPrint('🔌 URL: $_supabaseUrl');
    debugPrint('🔌 Anon Key: ${_supabaseAnonKey.substring(0, 20)}...');

    if (!_hasRealCredentials) {
      debugPrint(
          '🛠️ SUPABASE INIT: Missing real credentials, starting in offline demo mode');
      _client = SupabaseClient(_supabaseUrl, _supabaseAnonKey);
      _offlineFallback = true;
      return;
    }

    try {
      await Supabase.initialize(
        url: _supabaseUrl,
        anonKey: _supabaseAnonKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
        ),
      );
      _client = Supabase.instance.client;
      debugPrint('✅ SUPABASE INIT: Completed successfully');
    } catch (e, stackTrace) {
      debugPrint('❌ SUPABASE INIT ERROR: $e');
      debugPrint('❌ STACK TRACE: $stackTrace');
      debugPrint(
          '⚠️ SUPABASE INIT: Falling back to offline demo client so the UI can load');
      _client = SupabaseClient(_supabaseUrl, _supabaseAnonKey);
      _offlineFallback = true;
    }
  }

  static SupabaseClient get client => _client ?? Supabase.instance.client;

  static GoTrueClient get auth => client.auth;
  static SupabaseStorageClient get storage => client.storage;

  static bool get isOfflineFallback => _offlineFallback;
}
