import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  PrefsService._();

  factory PrefsService() {
    if (_instance == null) {
      throw Exception('PrefsService must be initialized first.');
    }
    return _instance;
  }

  static Future<void> init() async {
    if (_instance == null) {
      _instance = PrefsService._();
      _instance._prefs = await SharedPreferences.getInstance();
    }
  }

  static PrefsService _instance;

  SharedPreferences get prefs => _prefs;
  SharedPreferences _prefs;

  T load<T>(String key, T defaultValue) {
    if (_prefs.containsKey(key)) {
      if (T == bool) {
        return _prefs.getBool(key) as T;
      } else if (T == String) {
        return _prefs.getString(key) as T;
      } else if (T == int) {
        return _prefs.getInt(key) as T;
      } else if (T == double) {
        return _prefs.getDouble(key) as T;
      }
    }

    return defaultValue;
  }

  Future save<T>(String key, T value) async {
    if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }
}

class PrefsKeys {
  const PrefsKeys._();

  static const _prefixSettings = 'settings_';
  static const posterSize = '${_prefixSettings}poster_size';
  static const profileSize = '${_prefixSettings}profile_size';
  static const language = '${_prefixSettings}language';
  static const region = '${_prefixSettings}region';
  static const includeAdult = '${_prefixSettings}include_adult';
  static const resultsViewType = '${_prefixSettings}results_view_type';
}
