import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future init() async {
    // Obtain shared preferences.
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set setName(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set setDarkMode(bool val) {
    _isDarkMode = val;
    _prefs.setBool('isDarkMode', val);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set setGender(int val) {
    _gender = val;
    _prefs.setInt('gender', val);
  }
}
