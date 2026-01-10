import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/models/quran_name_verses.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class MostRecentlyContainer extends StatelessWidget {
  int index;

  MostRecentlyContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.04,
              vertical: context.height * 0.013,
            ),
            child: Column(
              spacing: context.height * 0.009,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(QuranNameVerses.englishQuranSurahsList[index],
                    style: AppStyles.black24Bold),
                Text(QuranNameVerses.arabicQuranSuraslist[index],
                    style: AppStyles.black24Bold),
                Text("${QuranNameVerses.versesNumber[index]} Verses",
                    style: AppStyles.black14Bold),
              ],
            ),
          ),
          Image.asset(AppAssets.mostRecentlyBg, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
