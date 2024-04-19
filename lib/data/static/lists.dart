import 'package:flutter/material.dart';
import 'package:flight_app/data/models/on_boarding_model.dart';
import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
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

final List<PageViewModel> pages = [
  /////////page 1
  PageViewModel(
    pageColor: Colors.white,
    iconImageAssetPath: AppImages.chooseDes,
    // bubble: Image.asset(AppImages.onBoard1),
    body: Text(
      AppStrings.findYourDes,
    ),
    title: Text(
      AppStrings.chooseDes,
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      color: Colors.black,
    ),
    bodyTextStyle: const TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
    ),
    mainImage: Image.asset(
      AppImages.chooseDes,
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
  ),
  ////////page 2
  PageViewModel(
    pageColor: Colors.white,
    iconImageAssetPath: AppImages.setBag,
    body: Text(
      AppStrings.prepare,
    ),
    title: Text(AppStrings.setBag),
    mainImage: Image.asset(
      AppImages.setBag,
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      color: Colors.black,
    ),
    bodyTextStyle: const TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
    ),
  ),
  ///////page 3
  PageViewModel(
    // pageBackground: Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       stops: [0.0, 1.0],
    //       begin: FractionalOffset.topCenter,
    //       end: FractionalOffset.bottomCenter,
    //       tileMode: TileMode.repeated,
    //       colors: [
    //         Colors.orange,
    //         Colors.pinkAccent,
    //       ],
    //     ),
    //   ),
    // ),
    iconImageAssetPath: AppImages.fly,
    body: Text(
      AppStrings.content3,
    ),
    title: Text(AppStrings.fly),
    mainImage: Image.asset(
      AppImages.fly,
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      color: Colors.black,
    ),
    bodyTextStyle: const TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
    ),
  ),
];

// List<Introduction>? boardingList2 = [
//   Introduction(
//     imageUrl: AppImages.onBoard1,
//     title: AppStrings.title1,
//     subTitle: AppStrings.content1,
//   ),
//   Introduction(
//     imageUrl: AppImages.onBoard2,
//     title: AppStrings.title2,
//     subTitle: AppStrings.content2,
//   ),
//   Introduction(
//     imageUrl: AppImages.onBoard3,
//     title: AppStrings.title3,
//     subTitle: AppStrings.content3,
//   ),
//]
