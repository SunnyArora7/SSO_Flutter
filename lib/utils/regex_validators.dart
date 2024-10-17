import 'dart:async';

import 'package:intl_phone_field/phone_number.dart';

class RegexConstants {
  static String fontName = 'Poppins';
  static String mobileNumberRegex = r'^(?:[+0]9)?[0-9]{10}$';
  static String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}

class RegexValidators {
  static RegExp mobileNumberRegex = RegExp(RegexConstants.mobileNumberRegex);
  static RegExp emailRegex = RegExp(RegexConstants.emailRegex);
}

class Validators {
  static String? Function(String?)? isEmptyValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return "This field can't be empty";
    } else {
      return null;
    }
  };

  static String? Function(String?)? inputOtpValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return 'OTP Must be entered';
    } else if (val.length < 6) {
      return 'OTP Must be entered';
    } else {
      return null;
    }
  };

  static String? Function(String?)? mobileNumberValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return 'Mobile number must be entered';
    } else if (val.isNotEmpty && val.length < 10 || val.length > 17) {
      return 'Number must be between 7 and 14 digits';
    } else {
      return null;
    }
  };
  static String? Function(String?)? isTouchedEmailValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return "This can't be empty";
    } else if (!RegexValidators.emailRegex.hasMatch(val)) {
      return 'Enter Valid E-mail';
    } else {
      return null;
    }
  };

  static String? Function(String?)? passwordChangeValidator = (String? value) {
    var val = value?.trim();
    return (val == null ||
            val.isEmpty ||
            val.length < 8 ||
            val.length > 20 ||
            !RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$')
                .hasMatch(val))
        ? "Password must be between 8 and 20 characters and contain at least one letter, one digit, and one special character."
        : null;
  };

  static String? Function(String?)? isTouchedValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return "This field can't be empty";
    } else if (RegExp(r'^\+[0-9]+$').hasMatch(val) &&
        val.length >= 10 &&
        val.length <= 17) {
      // Check if it's a valid number with a "+" symbol at the beginning
      // Additional check for valid number if needed
      return null; // It's a valid number
    } else if (RegexValidators.emailRegex.hasMatch(val)) {
      // Check if it's a valid email
      return null; // It's a valid email
    } else {
      return 'Enter Valid Number or E-mail';
    }
  };

  String? isEmptyField(String? value) {
    var val = value?.trim();
    if (val == null || val.isEmpty) {
      return "Field cannot be empty"; // Return an error message if the field is empty
    } else {
      return null; // Return null if the field is not empty
    }
  }

  //This method is used on request recharge to check the minimum credit balance should be greater than 0.
  static String? creditCheck(String? value) {
    var val = value?.trim();
    if (val == null || val.isEmpty) {
      return "Field cannot be empty"; // Return an error message if the field is empty
    } else if (double.parse(val) == 0.0) {
      return "Value should be greater than 0";
    } else {
      return null; // Return null if the field is not empty and meets the criteria
    }
  }

  static FutureOr<String?> phoneNumberValidator(PhoneNumber? phoneNumber) {
    if (phoneNumber == null || phoneNumber.number.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  static String? otpCheck(String? value) {
    var val = value?.trim();
    if (val == null || val.isEmpty) {
      return "Fields cannot be empty"; // Return an error message if the field is empty
    } else if (val.length != 4) {
      return "OTP must be of 4 digits";
    } else {
      return null; // Return null if the field is not empty and meets the criteria
    }
  }

  static String? alphabetCheck(String? value) {
    var val = value?.trim();
    if (val == null || val.isEmpty) {
      return "Field cannot be empty"; // Return an error message if the field is empty
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
      return "Field must contain only alphabets and spaces";
    } else {
      return null; // Return null if the field contains only alphabets and spaces
    }
  }

  static String? mobileCountryCheck(String? value) {
    var val = value?.trim();
    if (val!.startsWith("+93")) {
      return null;
    } else {
      return "We do not serve this region...";
    }
  }
}
