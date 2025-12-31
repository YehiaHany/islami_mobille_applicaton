import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';

class TitleRow extends StatelessWidget {
  String title;

  TitleRow({super.key, required this.title});

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
          Image.asset(AppAssets.leftBlackCorner),
          Expanded(
            child: Text(
              title,
              style: AppStyles.black24Bold,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
          Image.asset(AppAssets.rightBlackCorner),
        ],
      ),
    );
  }
}
