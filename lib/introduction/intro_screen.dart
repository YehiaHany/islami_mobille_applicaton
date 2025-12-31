import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/introduction/widgets/screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/utils/app_assets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  String rightButtonText = "Next";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.04,
              vertical: context.height * 0.018),
          child: Column(
            children: [
              Image.asset(
                AppAssets.islamiIntroLogo, height: context.height * 0.2,),
              SizedBox(height: context.height * 0.05,),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      if (index == 4) {
                        rightButtonText = "Finish";
                      } else {
                        rightButtonText = "Next";
                      }
                    });
                  },
                  children: [
                    Screen(
                      imgPath: AppAssets.marhbaLogo,
                      title: "Welcome To Islmi App",
                    ),
                    Screen(
                      imgPath: AppAssets.kabbaLogo,
                      title: "Welcome To Islmi App",
                      body: "We Are Very Excited To Have You In Our Community",
                    ),
                    Screen(
                      imgPath: AppAssets.moshefLogo,
                      title: "Reading the Quran",
                      body: "Read, and your Lord is the Most Generous",
                    ),
                    Screen(
                      imgPath: AppAssets.doaaLogo,
                      title: "Bearish",
                      body: "Praise the name of your Lord, the Most High",
                    ),
                    Screen(
                      imgPath: AppAssets.MicrophoneLogo,
                      title: "Holy Quran Radio",
                      body:
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.048,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? SizedBox()
                      : GestureDetector(
                        onTap: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontFamily: 'Janna',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.yellowColor,
                          ),
                        ),
                      ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 2.5,
                      dotHeight: 7,
                      dotWidth: 7,
                      spacing: 11.0,
                      dotColor: AppColors.grayColor,
                      activeDotColor: AppColors.yellowColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentIndex == 4) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.homeScreen);
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      rightButtonText,
                      style: TextStyle(
                        fontFamily: 'Janna',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
