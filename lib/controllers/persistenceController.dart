// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class PersistenceController {
  static addName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static removeName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
  }
}
