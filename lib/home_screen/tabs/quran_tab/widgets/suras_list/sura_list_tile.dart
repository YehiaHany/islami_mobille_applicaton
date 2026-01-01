import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/suras_list/widget/verses_widget.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../models/quran_name_verses.dart';

class SuraListTile extends StatelessWidget {
  int index;

  SuraListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.width * 0.058,
      children: [
        VersesWidget(index: index),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${QuranNameVerses.englishQuranSurahsList[index]}",
                style: AppStyles.white20Bold,
              ),
              Text(
                "${QuranNameVerses.versesNumber[index]} Verses",
                style: AppStyles.white14Bold,
              ),
            ],
          ),
        ),
        Text(
          "${QuranNameVerses.arabicQuranSuraslist[index]}",
          style: AppStyles.white20Bold,
        ),
      ],
    );
    ;
  }
}
