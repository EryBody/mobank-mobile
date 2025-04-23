
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginSecureStorage {

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  late final FlutterSecureStorage storage;

  LoginSecureStorage() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  final String _email = 'transferBossEmailAddressForLogin';

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
