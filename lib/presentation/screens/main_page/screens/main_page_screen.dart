import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../controllers/main_page_controller/main_page_controller_cubit.dart';
import '../../../../data/data_source/static/lists.dart';
import '../../../core/managers/app_images.dart';
import '../../../core/resources/color_manager.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageControllerCubit(),
      child: BlocConsumer<MainPageControllerCubit, MainPageControllerState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainPageControllerCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.dark,
              ),
            ),
            /* ---------- Bottom Navigation Bar ---------- */

            bottomNavigationBar: SalomonBottomBar(
              currentIndex: cubit.currentIndex,
              items: [
                SalomonBottomBarItem(
                  title: const Text('Explore'),
                  icon: Image.asset(
                    AppImages.exploreIcon,
                    color: cubit.currentIndex == 0
                        ? AppColors.primaryColor
                        : const Color(0xff82898F),
                  ),
                ),
                SalomonBottomBarItem(
                  title: const Text('Flights'),
                  icon: Image.asset(
                    AppImages.planeIcon,
                    color: cubit.currentIndex == 1
                        ? AppColors.primaryColor
                        : const Color(0xff82898F),
                  ),
                ),
                SalomonBottomBarItem(
                  title: const Text('Favourites'),
                  icon: Image.asset(
                    AppImages.favIcon,
                    color: cubit.currentIndex == 2
                        ? AppColors.primaryColor
                        : const Color(0xff82898F),
                  ),
                ),
                SalomonBottomBarItem(
                  title: const Text('Profile'),
                  icon: Image.asset(
                    AppImages.profileIcon,
                    color: cubit.currentIndex == 3
                        ? AppColors.primaryColor
                        : const Color(0xff82898F),
                  ),
                ),
              ],
              onTap: (value) => cubit.onTap(value),
            ),

            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: cubit.currentIndex,
            //   items: [
            //     BottomNavigationBarItem(
            //         icon: Image.asset(
            //           AppImages.exploreIcon,
            //           color: cubit.currentIndex == 0
            //               ? AppColors.primaryColor
            //               : const Color(0xff82898F),
            //         ),
            //         label: 'Explore'),
            //     BottomNavigationBarItem(
            //         icon: Image.asset(
            //           AppImages.planeIcon,
            //           color: cubit.currentIndex == 1
            //               ? AppColors.primaryColor
            //               : const Color(0xff82898F),
            //         ),
            //         label: 'Flights'),
            //     BottomNavigationBarItem(
            //         icon: Image.asset(
            //           AppImages.favIcon,
            //           color: cubit.currentIndex == 2
            //               ? AppColors.primaryColor
            //               : const Color(0xff82898F),
            //         ),
            //         label: 'Favourites'),
            //     BottomNavigationBarItem(
            //         icon: Image.asset(
            //           AppImages.profileIcon,
            //           color: cubit.currentIndex == 3
            //               ? AppColors.primaryColor
            //               : const Color(0xff82898F),
            //         ),
            //         label: 'Profile'),
            //   ],
            //   onTap: (value) {
            //     cubit.onTap(value);
            //   },
            // ),
            body: screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
