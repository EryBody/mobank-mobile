
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSecureStorage {

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  late final FlutterSecureStorage storage;

  AuthSecureStorage() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  final String _token = 'TokenKey';
  final String _username = 'UsernameKey';
  final String _isOnboardingDone = 'onboardingKey';
  final String _email = 'EmailKey';


  Future setToken(String token) async {
    await storage.write(key: _token, value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _token);
  }

  Future setUserName(String username) async {
    await storage.write(key: _username, value: username);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _username);
  }

  Future setIsOnboardingDone(String onboardingStatus) async {
    await storage.write(key: _isOnboardingDone, value: onboardingStatus);
  }

  Future<String?> getIsOnboardingDone() async {
    return await storage.read(key: _isOnboardingDone);
  }


  Future setEmail(String email) async {
    await storage.write(key: _email, value: email);
  }

  Future<String?> getEmail() async {
    return await storage.read(key: _email);
  }

  Future<void> clear() async {
    await storage.deleteAll();
  }

}
