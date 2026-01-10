import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/home_screen/home_screen.dart';
import 'package:islami/home_screen/tabs/hadeth_tab/widgets/hadeeth_details/HadeethDetails.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/sura_details.dart';
import 'package:islami/introduction/intro_screen.dart';
import 'package:islami/providers/most_recently_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MostRecentlyProvider(),
      child: MyApp(),
    ),
  );
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
        AppRoutes.hadeethDetailsScreen: (context) => HadeethDetails(),
      },
    );
  }
}
