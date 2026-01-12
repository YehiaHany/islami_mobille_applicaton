import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class AyaContainer extends StatelessWidget {
  String aya;
  int index;
  int selectedIndex;

  AyaContainer(
      {super.key, required this.aya, required this.index, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: context.height * 0.0112),
      decoration: BoxDecoration(
        color: index == selectedIndex ? AppColors.yellowColor : AppColors
            .transparentColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.yellowColor, width: 1),
      ),
      child: Text(
        aya,
        style: index == selectedIndex ? AppStyles.black20Bold : AppStyles
            .yellow20Bold,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
