import 'package:flight_app/data/static/lists.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '../../../data/local/cache_helper.dart';
import '../enter_data/enter_data_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        showNextButton: true,
        showBackButton: false,
        showSkipButton: true,
        onTapSkipButton: () {
          CacheHelper.savaData(key: 'skipBoarding', value: true);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return  EnterData();
            },
          ), (route) => false);
        },
        onTapDoneButton: () {
          CacheHelper.savaData(key: 'skipBoarding', value: true);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return  EnterData();
            },
          ), (route) => false);
        },
        pageButtonTextStyles: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
