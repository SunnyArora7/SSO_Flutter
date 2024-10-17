import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../../utils/size_utils.dart';
import '../../utils/gradient.dart';
import '../../utils/preference_manager.dart';
import '../../utils/strings_constants.dart';
import '../../utils/utils.dart';
import '../services/splash_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: ThemeGradient.linearGradient),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 74.h,
            ),
            // SvgPicture.asset(ImageConstants.nameImage),
            SizedBox(
              height: 22.h,
            ),
            Stack(
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: SvgPicture.asset(ImageConstants.boyImage),
                // ),
                Column(
                  children: [
                    SizedBox(
                      height: 177.h,
                    ),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: SvgPicture.asset(ImageConstants.girlImage),
                    // ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
