import 'package:flutter/material.dart';
import 'package:sso/utils/size_utils.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/theme.dart';

class SuccessfulDialog extends StatelessWidget {
  String title;
  final Function buttonFunction;

  SuccessfulDialog({
    Key? key,
    required this.title,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 316.h),
          child: Card(
            color: BackgroundColor.lightGrey,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 23.h),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          buttonFunction.call();
                        },
                        child:  Icon(
                          Icons.close,
                          color: IconColor.red,
                          size: 30.h,
                          // size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CircleAvatar(
                    radius: 34.adaptSize,
                    backgroundColor: BackgroundColor.green,
                    child: const Icon(
                      Icons.done,
                      color: IconColor.white,
                      size: 45.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: appPrimaryTheme.textTheme.headlineMedium?.copyWith(
                        color: TextColor.darkGrey, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 45.h,
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
