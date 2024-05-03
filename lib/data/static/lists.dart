import 'package:flutter/material.dart';
import 'package:flight_app/data/models/on_boarding_model.dart';
import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import '../../presentation/core/managers/app_images.dart';
import '../../presentation/screens/main_page/screens/explore_screen.dart';
import '../../presentation/screens/main_page/screens/favourites_screen.dart';
import '../../presentation/screens/main_page/screens/flights_screen.dart';
import '../../presentation/screens/main_page/screens/profile_screen.dart';

final List<Widget> screens = [
  ExploreScreen(),
  FlightsScreen(),
  FavouritesScreen(),
  ProfileScreen(),
];

List<OnBoardingModel> boardingList = [
  OnBoardingModel(
    image: AppImages.chooseDes,
    title: AppStrings.chooseDes,
    content: AppStrings.findYourDes,
  ),
  OnBoardingModel(
    image: AppImages.setBag,
    title: AppStrings.setBag,
    content: AppStrings.prepare,
  ),
  OnBoardingModel(
    image: AppImages.fly,
    title: AppStrings.fly,
    content: AppStrings.content3,
  ),
];

List<Introduction>? boardingList2 = [
  Introduction(
    imageUrl: AppImages.onBoard1,
    title: AppStrings.title1,
    subTitle: AppStrings.content1,
  ),
  Introduction(
    imageUrl: AppImages.onBoard2,
    title: AppStrings.title2,
    subTitle: AppStrings.findYourDes,
  ),
  Introduction(
    imageUrl: AppImages.onBoard3,
    title: AppStrings.title3,
    subTitle: AppStrings.content3,
  ),
];
