import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_styles.dart';

class TasbeehText extends StatelessWidget {
  String tasbeeh;
  int count;

  TasbeehText({super.key, required this.tasbeeh, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SizedBox(height: context.height * 0.09),
        Text(
          "$tasbeeh",
          style: AppStyles.white36Bold,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        Text(
          "$count",
          style: AppStyles.white36Bold,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
