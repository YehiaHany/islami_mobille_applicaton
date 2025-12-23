import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class MostRecentlyContainer extends StatelessWidget {
  const MostRecentlyContainer({super.key});

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
                Text("Al-Anbia", style: AppStyles.black24Bold),
                Text("الانبياء", style: AppStyles.black24Bold),
                Text("112 Verses", style: AppStyles.black14Bold),
              ],
            ),
          ),
          Image.asset(AppAssets.mostRecentlyBg, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
