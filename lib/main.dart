import 'package:flight_app/data/local/cache_helper.dart';
import 'package:flight_app/presentation/core/managers/strings.dart';
import 'package:flight_app/presentation/core/resources/theme_manager.dart';
import 'package:flight_app/presentation/screens/enter_data/enter_data_screen.dart';
import 'package:flight_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? boarding = CacheHelper.getBoolean(key: 'skipBoarding');
  Widget initialScreen = const SplashScreen();
  if (boarding != null) {
    if (boarding) {
      initialScreen = EnterData();
    } else {
      initialScreen = SplashScreen();
    }
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
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: initial,
    );
  }
}
