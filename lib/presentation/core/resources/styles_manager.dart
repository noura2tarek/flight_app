import 'package:flutter/material.dart';

//inter bold style 25
TextStyle myTextStyle({
  required var color,
  double size = 25.0,
  FontWeight fontWeight = FontWeight.bold,
}) {
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

//inter semi bold 24
TextStyle interSemiBold24 = const TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 24.0,
  fontFamily: 'Inter',
);

//inter medium 14
TextStyle interMedium14 = const TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xff667085),
  fontSize: 14.0,
  fontFamily: 'Inter',
);

//inter semi bold 17
TextStyle interSemiBold17({required var color}) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    color: color,
    fontSize: 17.0,
    fontFamily: 'Inter',
  );
}

//inter regular 14
TextStyle interRegular14 = const TextStyle(
  fontWeight: FontWeight.w400,
  color: Color(0xff1D2939),
  fontSize: 14.0,
  fontFamily: 'Inter',
);

//padding 20
//button height 50
//border radius 8
//text font size 30
