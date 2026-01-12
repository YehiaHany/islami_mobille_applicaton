import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AzanTimeWidget extends StatelessWidget {
  String azanName;
  String azanTime;

  AzanTimeWidget({super.key, required this.azanName, required this.azanTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        //
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.blackColor, AppColors.goldColor],
          ),
        ),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: "$azanName\n", style: AppStyles.white14Bold),
              TextSpan(
                text: "$azanTime\n",
                style: AppStyles.white16Bold.copyWith(fontSize: 24),
              ),
              TextSpan(
                text: int.parse(azanTime.substring(0, 2)) >= 12 ? "PM" : "AM",
                style: AppStyles.white14Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
