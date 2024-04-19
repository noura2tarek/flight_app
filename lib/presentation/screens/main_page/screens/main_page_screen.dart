import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../data/static/lists.dart';
import '../../../core/managers/app_images.dart';
import '../../../core/resources/color_manager.dart';

//make it with cubit
class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.exploreIcon,
                color: _currentIndex == 0
                    ? AppColors.primaryColor
                    : const Color(0xff82898F),
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.planeIcon,
                color: _currentIndex == 1
                    ? AppColors.primaryColor
                    : const Color(0xff82898F),
              ),
              label: 'Flights'),
          BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.favIcon,
                color: _currentIndex == 2
                    ? AppColors.primaryColor
                    : const Color(0xff82898F),
              ),
              label: 'Favourites'),
          BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.profileIcon,
                color: _currentIndex == 3
                    ? AppColors.primaryColor
                    : const Color(0xff82898F),
              ),
              label: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
