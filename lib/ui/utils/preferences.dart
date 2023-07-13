import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class LoginMechanism {
  static const String email = 'EMAIL';
  static const String fingerprint = 'FINGERPRINT';
  static const String face = 'FACE';
  static const String pin = 'PIN';
}

class Preference {
  static const String isFirstRun = 'isFirstRun';
  static const String isLangAR = 'LOGIN_MECHANISM';
  static const String isLogin = 'ONBOARDING_COMPLETE';
  static const String phoneNumber = 'PHONE_NUMBER';

  // One-time question: user asked if they want to use a PIN for authentication

  // Flag indicating if fingerprint authentication is supported

  static const String accessToken = 'ACCESS_TOKEN';
  static const String buyerId = 'BUYER_ID';

  static const String userID = 'USER_ID';

  static const String userFullName = 'USER_FULL_NAME';
  static const String userEmail = 'USER_EMAIL';
}

@injectable
class Preferences {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static final Preferences _singleton = Preferences._internal();
  factory Preferences() {
    return _singleton;
  }

  Preferences._internal();

  Future saveString(String name, String? value) async {
    await _secureStorage.write(key: name.toLowerCase(), value: value);
  }

  Future saveModel(String name, Object value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future userData(String name, String value) async {
    await _secureStorage.write(key: name.toLowerCase(), value: value);
  }

  Future saveBool(String name, bool value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future saveLOGOUT() async {
    await _secureStorage.deleteAll();
  }

  Future<String?> getString(String name) async {
    return await _secureStorage.read(key: name.toLowerCase());
  }

  Future<bool> getBool(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    return value == 'true';
  }

  Future<int> getInt(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    var intValue = value ?? '0';
    return int.parse(intValue);
  }

  Future saveInt(String name, int value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future remove(String name) async {
    await _secureStorage.delete(key: name.toLowerCase());
  }

  Future removeAll() async {
    await _secureStorage.deleteAll();
  }
}
