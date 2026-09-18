import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. Immutable Data Model
class UserData {
  final String? name;
  final String? email;

  const UserData({this.name, this.email});
}

// 2. StateNotifier to manage state and SharedPreferences
class UserInfoNotifier extends StateNotifier<UserData> {
  UserInfoNotifier() : super(const UserData(name: null, email: null)) {
    loadUser(); // Automatically loads saved data on initialization
  }

  static const String _nameKey = 'user_name';
  static const String _emailKey = 'user_email';

  // Load existing data from device storage
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final email = prefs.getString(_emailKey);
    state = UserData(name: name, email: email);
  }

  // Save new user data
  Future<bool> addUser(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);   // Fixed key/value bug
    await prefs.setString(_emailKey, email);
    state = UserData(name: name, email: email);
    return true;
  }

  // Clear user data on logout
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_emailKey);
    state = const UserData(name: null, email: null);
  }
}

// 3. The Riverpod Provider declaration
final userInfoProvider = StateNotifierProvider<UserInfoNotifier, UserData>((ref) {
  return UserInfoNotifier();
});