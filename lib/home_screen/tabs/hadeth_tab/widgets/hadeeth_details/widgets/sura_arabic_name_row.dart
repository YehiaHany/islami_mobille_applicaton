import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../models/quran_name_verses.dart';

class SuraArabicNameRow extends StatelessWidget {
  int index;

  SuraArabicNameRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * 0.02,
        right: context.width * 0.02,
        top: context.height * 0.018,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.leftYellowCorner),
          Text(
            QuranNameVerses.arabicQuranSuraslist[index],
            style: AppStyles.yellow24Bold,
          ),
          Image.asset(AppAssets.rightYellowCorner),
        ],
      ),
    );
  }
}
