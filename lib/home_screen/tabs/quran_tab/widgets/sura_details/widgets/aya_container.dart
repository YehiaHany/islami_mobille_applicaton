import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class AyaContainer extends StatelessWidget {
  String aya;

  AyaContainer({super.key, required this.aya});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: context.height * 0.0112),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.yellowColor, width: 1),
      ),
      child: Text(
        aya,
        style: AppStyles.yellow20Bold,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
