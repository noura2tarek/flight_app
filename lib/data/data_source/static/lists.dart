import 'package:flutter/material.dart';
import 'package:flight_app/data/models/on_boarding_model.dart';
import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import '../../../presentation/core/managers/app_images.dart';
import '../../../presentation/screens/main_page/screens/explore_screen.dart';
import '../../../presentation/screens/main_page/screens/favourites_screen.dart';
import '../../../presentation/screens/main_page/screens/flights_screen.dart';
import '../../../presentation/screens/main_page/screens/profile_screen.dart';


final List<Widget> screens = [
  ExploreScreen(),
  FlightsScreen(),
  FavouritesScreen(),
  ProfileScreen(),
];

List<OnBoardingModel> boardingList = [
  OnBoardingModel(
    image: AppImages.chooseDes,
    title: AppStringsEn.chooseDes,
    content: AppStringsEn.findYourDes,
  ),
  OnBoardingModel(
    image: AppImages.setBag,
    title: AppStringsEn.setBag,
    content: AppStringsEn.prepare,
  ),
  OnBoardingModel(
    image: AppImages.fly,
    title: AppStringsEn.fly,
    content: AppStringsEn.content3,
  ),
];

List<Introduction>? boardingList2 = [
  Introduction(
    imageUrl: AppImages.onBoard1,
    title: AppStringsEn.title1,
    subTitle: AppStringsEn.content1,
  ),
  Introduction(
    imageUrl: AppImages.onBoard2,
    title: AppStringsEn.title2,
    subTitle: AppStringsEn.findYourDes,
  ),
  Introduction(
    imageUrl: AppImages.onBoard3,
    title: AppStringsEn.title3,
    subTitle: AppStringsEn.content3,
  ),
];
