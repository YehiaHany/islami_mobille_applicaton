import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/home_screen/home_screen.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/sura_details.dart';
import 'package:islami/introduction/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introScreen,
      routes: {
        AppRoutes.introScreen: (context) => IntroScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.suraDetailsScreen: (context) => SuraDetails(),
      },
    );
  }
}
