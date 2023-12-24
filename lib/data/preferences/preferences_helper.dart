import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;
  PreferencesHelper({required this.sharedPreferences});

  static const user = 'USER';

  Future<String> get getUsername async {
    final prefs = await sharedPreferences;
    return prefs.getString(user) ?? "Selected User";
  }

  void setUser(String value) async {
    final prefs = await sharedPreferences;
    prefs.setString(user, value);
  }
}
