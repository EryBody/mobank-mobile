import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  late final FlutterSecureStorage _storage;

  SecureStorageService() {
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  // Save data securely
  Future<void> saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Retrieve data securely
  Future<String?> getData(String key) async {
    return await _storage.read(key: key);
  }

  // Remove data
  Future<void> removeData(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  //How to use
  //When setting
  // await secureStorageService.saveData('language', language ?? '');
  //When Getting
  // String? savedLanguage = await secureStorageService.getData('language');
}
