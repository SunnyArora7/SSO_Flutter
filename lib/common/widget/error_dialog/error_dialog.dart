import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sso/utils/size_utils.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/theme.dart';

class ErrorDialog extends StatefulWidget {
  final String errorText;
  final Function onPressed;

  const ErrorDialog(
      {Key? key, required this.errorText, required this.onPressed})
      : super(key: key);

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();

  static showErrorDialog(
      {String errorText = "Something Went Wrong",
      required Function onPressed}) {
    Get.dialog(
      barrierDismissible: false,
      ErrorDialog(
        errorText: errorText,
        onPressed: onPressed,
      ),
    );
  }
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: 16.w), // Adjust as needed
      backgroundColor: BackgroundColor.lightGrey,
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(0),
      elevation: 0,
      shadowColor: BackgroundColor.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      actions: [
        Center(
          child: SizedBox(
            width: 360.w,
            // height: 219.h,
            child: Padding(
              padding: EdgeInsets.only(top: 23.h, left: 15.w, right: 15.w),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Ensure the column takes minimum space
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        widget.onPressed();
                      },
                      child: Icon(
                        Icons.close,
                        color: IconColor.pink,
                        size: 30.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Icon(
                    Icons.error,
                    color: IconColor.pink,
                    size: 68.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.errorText,
                      textAlign: TextAlign.center,
                      style: appPrimaryTheme.textTheme.headlineMedium?.copyWith(
                          color: TextColor.darkGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
