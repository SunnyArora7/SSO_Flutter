import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sso/home/controller/home_controller.dart';
import 'package:sso/page_routes/page_route_constant.dart';
import 'package:sso/utils/preference_manager.dart';
import 'package:sso/utils/size_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to Home Screen",
            style: TextStyle(fontSize: 30),
          ),
          // Text(
          //   homeController.name.value.toString(),
          //   style: const TextStyle(fontSize: 30),
          // ),
          // Text(
          //   homeController.email.value.toString(),
          //   style: const TextStyle(fontSize: 30),
          // ),
          Text(
            PreferenceManager.getString(PreferenceManager.name).toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            PreferenceManager.getString(PreferenceManager.id).toString(),
            style: const TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 120.h,
          ),
          ElevatedButton(
              onPressed: () {
                PreferenceManager.setData(PreferenceManager.token, "");
                Get.offAllNamed(PageRouteConstant.login);
              },
              child: const Text("LOGOUT")),
        ],
      )),
    );
  }
}
