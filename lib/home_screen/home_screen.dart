import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami/home_screen/tabs/radio_tab/radio_tab.dart';
import 'package:islami/home_screen/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/home_screen/tabs/timer_tab/timer_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    HadethTab(),
    RadioTab(),
    TimerTab(),
  ];

// 430 x 862
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(getBackgroundImage(), fit: BoxFit.fill),
        ),
        // Positioned(
        //     left: 0,
        //     right: 0,
        //     top: 16,
        //     child: Image.asset(AppAssets.islamiIntroLogo)),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.yellowColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              showSelectedLabels: true,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedLabelStyle: TextStyle(
                fontFamily: "Janna",
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              selectedItemColor: AppColors.whiteColors,
              // backgroundColor: AppColors.yellowColor,
              //   type: BottomNavigationBarType.fixed,
              items: [
                buildBottomNavBarItem(
                  label: 'Quran',
                  iconPath: AppAssets.iconQuran,
                  index: 0,
                ),
                buildBottomNavBarItem(
                  label: 'Sebha',
                  iconPath: AppAssets.iconSebha,
                  index: 1,
                ),
                buildBottomNavBarItem(
                  label: 'Hadeth',
                  iconPath: AppAssets.iconHadeth,
                  index: 2,
                ),
                buildBottomNavBarItem(
                  label: 'Radio',
                  iconPath: AppAssets.iconRadio,
                  index: 3,
                ),
                buildBottomNavBarItem(
                  label: 'Timer',
                  iconPath: AppAssets.iconTimer,
                  index: 4,
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.islamiIntroLogo,
                  height: context.height * 0.2,
                ),
                Expanded(child: tabs[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        {
          return AppAssets.HomeBackground;
        }
      case 1:
        {
          return AppAssets.sebhaBackground;
        }
      case 2:
        {
          return AppAssets.hadethBackground;
        }
      case 3:
        {
          return AppAssets.radioBackground;
        }
      case 4:
        {
          return AppAssets.timerBackground;
        }
      default:
        {
          return AppAssets.HomeBackground;
        }
    }
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required String label,
    required iconPath,
    required index,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon:
          selectedIndex == index
              ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                child: Image.asset(iconPath, color: AppColors.whiteColors),
              )
              : Image(image: AssetImage(iconPath), color: AppColors.blackColor),
    );
  }
}
