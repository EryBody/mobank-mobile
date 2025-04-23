import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/user_data_model.dart';

class SignupSecureStorage {

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  late final FlutterSecureStorage _storage;

  SignupSecureStorage() {
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  // Save the entire data class securely
  Future<void> saveUserData(UserData userData) async {
    String jsonString = jsonEncode(userData.toJson()); // Convert the object to JSON string
    await _storage.write(key: 'userData', value: jsonString);
  }

  Future<UserData?> getUserData() async {
    String? jsonString = await _storage.read(key: 'userData'); // Retrieve the stored JSON string
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString); // Decode the JSON string back to a Map
      return UserData.fromJson(jsonMap); // Convert Map back to the UserData object
    }
    return null;
  }

  // Clear all data
  Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
}
