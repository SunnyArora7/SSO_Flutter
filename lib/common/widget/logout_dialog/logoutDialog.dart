import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sso/utils/size_utils.dart';
import '../../../utils/custom_button.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/theme.dart';

class LogoutDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function buttonFunction;
  final Function buttonFunctionTwo;
  final String buttonName;
  final String buttonNameTwo;

  const LogoutDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.buttonFunction,
      required this.buttonName,
      required this.buttonFunctionTwo,
      required this.buttonNameTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 280.h, left: 16.w, right: 16.w),
          child: Card(
            color: BackgroundColor.lightBlueWhite,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.fSize),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 23.h, bottom: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                          color: IconColor.pink,
                          size: 30,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: IconColor.pink,
                        size: 80.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        content,
                        style: appPrimaryTheme.textTheme.labelLarge?.copyWith(
                          color: TextColor.lightGrey,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UpdateButton(
                          onPressed: () {
                            buttonFunction.call();
                          },
                          context: context,
                          child: Text(
                            buttonName,
                            style: const TextStyle(color: TextColor.white),
                          )),
                      CancelButton(
                        onPressed: () {
                          buttonFunctionTwo.call();
                        },
                        context: context,
                        child: Text(buttonNameTwo,
                            style: const TextStyle(color: TextColor.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
