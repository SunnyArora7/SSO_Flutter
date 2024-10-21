import 'package:get/get.dart';
import 'package:sso/home/services/home_service.dart';

class HomeController extends GetxController {
  RxString name = "".obs;
  RxString phoneNumber = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;

  @override
  void onReady() {
    HomeService().getData();
    super.onReady();
  }
}
