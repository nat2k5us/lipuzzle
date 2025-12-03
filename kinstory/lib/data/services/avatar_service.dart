import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Service for managing custom avatar images
///
/// This service allows users to:
/// 1. Add custom avatar images to assets/avatars/
/// 2. Map character names to custom images in avatar-mappings.json
/// 3. Fallback to generated DiceBear avatars if no custom image exists
class AvatarService {
  static final AvatarService _instance = AvatarService._internal();
  factory AvatarService() => _instance;
  AvatarService._internal();

  Map<String, String>? _avatarMappings;
  bool _isInitialized = false;

  /// Initialize the avatar service by loading mappings from JSON
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      final jsonString = await rootBundle.loadString('assets/avatar-mappings.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      final mappings = jsonData['mappings'] as Map<String, dynamic>?;
      if (mappings != null) {
        _avatarMappings = mappings.map((key, value) => MapEntry(key, value.toString()));
      } else {
        _avatarMappings = {};
      }

      _isInitialized = true;
      print('✅ AvatarService: Loaded ${_avatarMappings!.length} custom avatar mappings');
    } catch (e) {
      print('⚠️ AvatarService: Failed to load avatar mappings: $e');
      _avatarMappings = {};
      _isInitialized = true;
    }
  }

  /// Get avatar URL for a person
  ///
  /// Priority:
  /// 1. Check for custom local image in assets/avatars/
  /// 2. Fall back to DiceBear generated avatar
  String getAvatarUrl({
    required String firstName,
    String? lastName,
    required String gender,
  }) {
    // Ensure initialized
    if (!_isInitialized) {
      print('⚠️ AvatarService: Not initialized, using fallback avatar');
      return _generateDiceBearUrl(firstName, lastName, gender);
    }

    final fullName = lastName != null ? '$firstName $lastName' : firstName;

    // Check for custom avatar mapping
    if (_avatarMappings!.containsKey(fullName)) {
      final customImage = _avatarMappings![fullName]!;
      final assetPath = 'assets/avatars/$customImage';
      print('✅ AvatarService: Using custom avatar for $fullName: $assetPath');
      return assetPath;
    }

    // Check for first name only mapping
    if (_avatarMappings!.containsKey(firstName)) {
      final customImage = _avatarMappings![firstName]!;
      final assetPath = 'assets/avatars/$customImage';
      print('✅ AvatarService: Using custom avatar for $firstName: $assetPath');
      return assetPath;
    }

    // Fall back to DiceBear
    return _generateDiceBearUrl(firstName, lastName, gender);
  }

  /// Generate DiceBear avatar URL with culturally appropriate settings
  String _generateDiceBearUrl(String firstName, String? lastName, String gender) {
    final seed = Uri.encodeComponent('${firstName} ${lastName ?? ''}');
    final isFemale = gender.toLowerCase() == 'female';

    if (isFemale) {
      return 'https://api.dicebear.com/7.x/notionists/png?seed=$seed'
          '&skinColor=f3d2c1,d08b5b,ae5d29,614335' // South Asian skin tones
          '&backgroundColor=ffd5dc,ffe5b4,d4f1f4'; // Soft backgrounds
    } else {
      return 'https://api.dicebear.com/7.x/notionists/png?seed=$seed'
          '&skinColor=f3d2c1,d08b5b,ae5d29,614335' // South Asian skin tones
          '&backgroundColor=b6e3f4,c0aede,d1d4f9'; // Cool backgrounds
    }
  }

  /// Check if a custom avatar exists for a person
  bool hasCustomAvatar(String fullName) {
    return _avatarMappings?.containsKey(fullName) ?? false;
  }

  /// Get all custom avatar mappings (for debugging/admin UI)
  Map<String, String> getAllMappings() {
    return Map.from(_avatarMappings ?? {});
  }
}
