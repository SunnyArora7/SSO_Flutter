import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constants.dart';


class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Center(
            child: CircularProgressIndicator(
          color: BackgroundColor.pink,
        )));
  }

  static showProgressIndicatorAlertDialog() {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
  }

  static removeProgressIndicatorAlertDialog() {
    Get.back();
  }
}
