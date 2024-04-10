import 'package:flight_app/data/models/on_boarding_model.dart';
import 'package:flight_app/presentation/core/managers/strings.dart';

import '../../presentation/core/managers/images.dart';

List<OnBoardingModel> boardingList = [
  OnBoardingModel(
    image: AppImages.onBoard1,
    title: AppStrings.title1,
    content: AppStrings.content1,
  ),
  OnBoardingModel(
    image: AppImages.onBoard2,
    title: AppStrings.title2,
    content: AppStrings.content2,
  ),
  OnBoardingModel(
    image: AppImages.onBoard3,
    title: AppStrings.title3,
    content: AppStrings.content3,
  ),
];
