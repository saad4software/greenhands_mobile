import 'package:shared_preferences/shared_preferences.dart';

/// Singleton utility for managing persistent application preferences and user location.
class PrefModel {
  static PrefModel? _instance;
  static SharedPreferences? _preferences;

  PrefModel._();

  /// Gets the global singleton instance of [PrefModel].
  static PrefModel get instance {
    _instance ??= PrefModel._();
    return _instance!;
  }

  /// Initializes SharedPreferences instance. Should be called at app startup.
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Latitude coordinate of user / default location.
  double? get lat => _preferences?.getDouble('user_lat');

  /// Sets latitude coordinate.
  set lat(double? value) {
    if (value != null) {
      _preferences?.setDouble('user_lat', value);
    } else {
      _preferences?.remove('user_lat');
    }
  }

  /// Longitude coordinate of user / default location.
  double? get lng => _preferences?.getDouble('user_lng');

  /// Sets longitude coordinate.
  set lng(double? value) {
    if (value != null) {
      _preferences?.setDouble('user_lng', value);
    } else {
      _preferences?.remove('user_lng');
    }
  }
}
