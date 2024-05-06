import 'package:flight_app/presentation/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import '../../../data/data_source/local/cache_helper.dart';
import '../../../data/data_source/static/lists.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: boardingList2,
      onTapSkipButton: () {
        CacheHelper.savaData(key: 'skipBoarding', value: true);
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.enterDataRoute, (route) => false);
      },
    );
  }
}
