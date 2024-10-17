import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxString firebaseToken = "".obs;
  RxString googleToken = "".obs;
  RxString microsoftToken = "".obs;
}
