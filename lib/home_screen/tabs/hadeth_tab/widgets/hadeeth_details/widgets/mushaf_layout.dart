import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../../../core/utils/app_styles.dart';

class MushafLayout extends StatelessWidget {
  String suraContent;

  MushafLayout({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(
          left: context.width * 0.02,
          right: context.width * 0.02,
        ),
        child: Text(
          suraContent,
          style: AppStyles.yellow20Bold.copyWith(
            height: context.height * 0.0029,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
