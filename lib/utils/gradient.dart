import 'package:flutter/material.dart';

class ThemeGradient {
  static LinearGradient linearGradient = LinearGradient(
    colors: [
      const Color(0XFF0282C3).withOpacity(0.1),
      const Color(0XFFED0A51).withOpacity(0.4),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.40, 1.0],

  );
}
