import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AzkarContainer extends StatelessWidget {
  String imgPath;
  String title;

  AzkarContainer({super.key, required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blackColor,
          border: Border.all(color: AppColors.yellowColor, width: 2),
        ),
        child: Column(
          children: [
            Image.asset(imgPath),
            Text(title, style: AppStyles.white20Bold),
          ],
        ),
      ),
    );
  }
}
