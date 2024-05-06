import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:flight_app/presentation/core/resources/routes_manager.dart';
import 'package:flight_app/presentation/core/resources/theme_manager.dart';
import 'package:flight_app/presentation/screens/enter_data/enter_data_screen.dart';
import 'package:flight_app/presentation/screens/main_page/screens/main_page_screen.dart';
import 'package:flight_app/presentation/screens/splash/splash_screen.dart';
import 'package:flight_app/presentation/screens/verify_code/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'data/data_source/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? boarding = CacheHelper.getBoolean(key: 'skipBoarding');
  bool? passEnterData = CacheHelper.getBoolean(key: 'passEnterDate');
  bool? passBirthDate = CacheHelper.getBoolean(key: 'passBirthDate');
  bool? passVerifyCode = CacheHelper.getBoolean(key: 'passVerifyCode');
  Widget initialScreen = const SplashScreen();
  if (boarding != null) {
      if(passEnterData != null && passBirthDate != null) {
        if(passVerifyCode != null){
          initialScreen = MainPageScreen();
        } else {
          initialScreen = VerifyCodeScreen();
        }
    } else{
      initialScreen = EnterData();
    }
  } else{
    initialScreen = SplashScreen();
  }
  runApp(MyApp(
    initial: initialScreen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initial});
  final Widget initial;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStringsEn.appTitle,
      debugShowCheckedModeBanner: false,
      theme: theme,
      //initialRoute: AppRoutes.splashRoute,
      home: initial,
      routes: routes,
    );
  }
}
