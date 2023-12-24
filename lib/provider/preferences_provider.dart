import 'package:flutter/material.dart';
import 'package:suitmedia_assignment/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  PreferencesProvider({required this.preferencesHelper}) {
    getUser();
  }

  String _user = "Selecter User";
  String get user => _user;

  void getUser() async {
    _user = await preferencesHelper.getUsername;
    notifyListeners();
  }

  void setUsername(String value) {
    preferencesHelper.setUser(value);
    getUser();
  }
}
