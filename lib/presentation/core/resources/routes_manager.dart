import 'package:flight_app/presentation/screens/enter_data/enter_data_screen.dart';
import 'package:flight_app/presentation/screens/enter_data/select_bitrh_date.dart';
import 'package:flight_app/presentation/screens/main_page/screens/main_page_screen.dart';
import 'package:flight_app/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:flight_app/presentation/screens/payment/success_payment.dart';
import 'package:flight_app/presentation/screens/verify_code/verify_code_screen.dart';
import 'package:flutter/material.dart';
import '../../screens/payment/checkout_screen.dart';

//routes names class
class AppRoutes{
  //splash
  //static const String splashRoute = '/';
  //on boarding
  static const String onBoardingRoute = "/onBoarding";
  static const String enterDataRoute = "/enterData";
  static const String enterBirthDateRoute = "/enterBirthDate";
  static const String verifyCodeRoute = "/verifyCode";
  static const String mainPageRoute = "/mainPage";
  static const String checkOutRoute = "/checkout";
  static const String successPaymentRoute = "/successPayment";
}


Map<String, Widget Function(BuildContext)> routes = {
  // splash
  //AppRoutes.splashRoute : (context) =>  const SplashScreen(),
  //on boarding
  AppRoutes.onBoardingRoute : (context) =>  const OnBoardingScreen(),
  AppRoutes.enterDataRoute : (context) =>   EnterData(),
  AppRoutes.enterBirthDateRoute : (context) => const SelectBirthDateScreen(),
  AppRoutes.verifyCodeRoute : (context) => const VerifyCodeScreen(),
  AppRoutes.mainPageRoute : (context) => const MainPageScreen(),
  AppRoutes.checkOutRoute : (context) =>   PaymentScreen(),
  AppRoutes.successPaymentRoute : (context) => const SuccessPaymentScreen(),

};