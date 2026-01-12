import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../models/azan_times.dart';
import 'azan_time_widget.dart';

class PrayerTimeContainer extends StatelessWidget {
  const PrayerTimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: context.width > 600 ? context.width * 0.75 : context.width * 0.95,
      //0.75
      decoration: BoxDecoration(
        color: AppColors.lightGoldColor,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(AppAssets.azanTimeDesign),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        // todo:make it dynamic
        spacing: context.height * 0.026,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("16 Jul,\n2024", style: AppStyles.white16Bold),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Pray Time\n",
                        style: AppStyles.black20Bold.copyWith(
                          color: AppColors.blackColor.withOpacity(0.71),
                        ),
                      ),
                      TextSpan(
                        text: "Tuesday",
                        style: AppStyles.black20Bold.copyWith(
                          color: AppColors.blackColor.withOpacity(0.90),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  textAlign: TextAlign.right,
                  "09 Muh,\n1446",
                  style: AppStyles.white16Bold,
                ),
              ],
            ),
          ),

          CarouselSlider(
            options: CarouselOptions(
              height: 106,
              aspectRatio: 86 / 106,
              viewportFraction: 0.31,
              //0.255
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeFactor: 0.25,
            ),
            items:
                List.generate(6, (index) => index).map((index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return AzanTimeWidget(
                        azanName: AzanTimes.azanTimesList[index].azanName,
                        azanTime: AzanTimes.azanTimesList[index].azanTime,
                      );
                    },
                  );
                }).toList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.058),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  child: SvgPicture.asset(
                    AppAssets.muteIcon,
                    color: AppColors.transparentColor,
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Next Pray ",
                        style: AppStyles.black16Bold.copyWith(
                          color: AppColors.blackColor.withOpacity(0.75),
                        ),
                      ),
                      TextSpan(text: "- 02:32", style: AppStyles.black16Bold),
                    ],
                  ),
                ),
                SvgPicture.asset(AppAssets.volumeSlashIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
