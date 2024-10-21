import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static const String token = "token";
  static const String keyFireToken = "firebaseToken";
  static const String KEYNAME = 'USERNAME';
  static const String KEYPASS = 'PASSWORD';
  static const String keyIsLogin = 'KEYISLOGIN';
  static const String name = 'username';
  static const String id = 'email';


  static setData(String key, dynamic value) async {
    getStorage().write(key, value);
  }

  static String? getString(String key) {
    return "${getStorage().read(key)}";
  }

  static GetStorage getStorage() {
    return GetStorage();
  }

  static deleteData() async {
    getStorage().erase();
  }
}
