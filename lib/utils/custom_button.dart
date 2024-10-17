import 'package:flutter/material.dart';
import 'size_utils.dart';

import 'color_constants.dart';

class PrimaryButton extends ElevatedButton {
  PrimaryButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    BuildContext? context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(330.w, 48.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class AddContactButton extends ElevatedButton {
  AddContactButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(80.w, 36.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class QuerySendButton extends ElevatedButton {
  QuerySendButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(95.w, 32.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class UpdateButton extends ElevatedButton {
  UpdateButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(155.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class DisableUpdateButton extends ElevatedButton {
  DisableUpdateButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.disabledColor,
            minimumSize: Size(155.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class DisableSkipButton extends ElevatedButton {
  DisableSkipButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.disabledColorBlue,
            minimumSize: Size(155.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class CancelButton extends ElevatedButton {
  CancelButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.royalBlue,
            minimumSize: Size(155.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class ApproveButton extends ElevatedButton {
  ApproveButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(160.w, 32.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class RejectButton extends ElevatedButton {
  RejectButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.royalBlue,
            minimumSize: Size(160.w, 32.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class SendButton extends ElevatedButton {
  SendButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(170.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class CancelQueryButton extends ElevatedButton {
  CancelQueryButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.granite,
            minimumSize: Size(170.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: TextColor.royalBlue),
          ),
        );
}

class SecondaryButton extends ElevatedButton {
  SecondaryButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.royalBlue,
            minimumSize: Size(340.w, 48.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class ResolvedButton extends ElevatedButton {
  ResolvedButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.pink,
            minimumSize: Size(170.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class NotResolvedButton extends ElevatedButton {
  NotResolvedButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.royalBlue,
            minimumSize: Size(170.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}

class DisableButton extends ElevatedButton {
  DisableButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    required BuildContext context,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ButtonColor.disabledColorBlue,
            minimumSize: Size(155.w, 42.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.fSize)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        );
}
