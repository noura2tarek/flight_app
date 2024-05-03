import 'package:flutter/material.dart';

//inter bold style 25
TextStyle myTextStyle(
    {required var color,
    double size = 17.0,
    FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(
    fontWeight: fontWeight,
    color: color,
    fontSize: size,
    wordSpacing: 2.0,
    letterSpacing: 0.4,
    fontFamily: 'Inter',
  );
}

//inter semi bold 14
TextStyle interSemiBold14 = const TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 14.0,
  fontFamily: 'Inter',
);

//padding 20
//button height 50
//border radius 8
//text font size 30
