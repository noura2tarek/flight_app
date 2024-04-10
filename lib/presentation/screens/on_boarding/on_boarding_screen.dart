import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flight_app/controllers/on_boarding_cubit.dart';
import 'package:flight_app/presentation/core/managers/strings.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/on_boarding/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/static/lists.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            OnBoardingCubit cubit = OnBoardingCubit.get(context);
            return Column(
              children: [
                /* -------------- Page View --------------- */
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    controller: cubit.controller,
                    itemBuilder: (context, index) {
                      return PageViewWidget(
                        model: boardingList[index],
                      );
                    },
                    onPageChanged: (value) {
                      cubit.onPageChanged(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 38.0,
                ),
                /* -------------- Smooth page indicator --------------- */
                SmoothPageIndicator(
                  controller: cubit.controller, // PageController
                  count: 3,
                  effect: SlideEffect(
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    dotColor: AppColors.greyColor!,
                    activeDotColor: AppColors.primaryColor,
                  ),
                  onDotClicked: (index) {},
                ),
                const SizedBox(
                  height: 100.0,
                ),
                /* -------------- Skip & Get started button --------------- */
                ConditionalBuilder(
                  condition: cubit.currentIndex == 2,
                  builder: (context) => CustomButton(
                    margin: 20.0,
                    text: AppStrings.getStarted,
                    function: () {
                      cubit.skip(context: context);
                    },
                  ),
                  fallback: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            cubit.skip(context: context);
                          },
                          child: Text(
                            AppStrings.skip,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.next(context: context);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryColor,
                            )),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
