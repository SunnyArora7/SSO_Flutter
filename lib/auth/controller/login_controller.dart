import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sso/auth/services/login_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxString firebaseToken = "".obs;
  RxString googleToken = "".obs;
  RxString microsoftToken = "".obs;

  @override
  void onReady() {
    LoginService().whereToGo();
    super.onReady();
  }
}
