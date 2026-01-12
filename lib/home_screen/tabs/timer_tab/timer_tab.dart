import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/timer_tab/widgets/azkar_container.dart';
import 'package:islami/home_screen/tabs/timer_tab/widgets/prayer_time_container.dart';

class TimerTab extends StatelessWidget {
  const TimerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.04), //
        child: Column(
          spacing: context.height * 0.022,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Expanded(child: PrayerTimeContainer())],
            ),
            Text("Azkar", style: AppStyles.white16Bold),
            Row(
              spacing: 20,
              children: [
                AzkarContainer(
                  title: "Evening Azkar",
                  imgPath: AppAssets.eveningAzkarIcon,
                ),
                AzkarContainer(
                  title: "Morning Azkar",
                  imgPath: AppAssets.morningAzkarIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
