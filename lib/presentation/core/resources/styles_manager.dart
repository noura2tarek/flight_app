
import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle myTextStyle({required var color, double size = 25.0, FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(
    fontWeight: fontWeight,
    color: color,
    fontSize: size,
    wordSpacing: 2.0,
    letterSpacing: 0.4,
    fontFamily: 'Inter',
  );
}
//padding 20
//button height 50
//border radius 8
//text font size 30
