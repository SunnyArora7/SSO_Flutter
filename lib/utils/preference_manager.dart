import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static const String token = "token";
  static const String keyFireToken = "firebaseToken";
  static const String keyNAME = 'USERNAME';
  static const String keyPASS = 'PASSWORD';
  static const String keyIsLogin = 'KEYISLOGIN';


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
