import 'dart:convert';

import 'package:get/get.dart';
import 'package:sso/home/controller/home_controller.dart';
import 'package:sso/home/model/home_model.dart';

import '../../common/widget/error_dialog/error_dialog.dart';
import '../../network/common_api_service.dart';

class HomeService {
  HomeController homeController = Get.put(HomeController());
  getData() async {
    final response = await CommonApiService().getHomeData();
    print(response.statusCode);
    List<dynamic> homeResponse = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<HomeModel> homeData =
          jsonData.map((json) => HomeModel.fromJson(json)).toList();
      homeController.name.value = homeData[1].name!;
      homeController.email.value = homeData[1].email!;
    } else {
      Get.dialog(ErrorDialog(
          errorText: "Error getting Data",
          onPressed: () {
            Get.back();
          }));
    }
  }
}
