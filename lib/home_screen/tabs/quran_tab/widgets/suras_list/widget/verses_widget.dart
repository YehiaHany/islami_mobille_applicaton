import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_styles.dart';

class VersesWidget extends StatelessWidget {
  int index;

  VersesWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(AppAssets.vectorIcon, width: context.width * 0.16),
        Text(
          "${index + 1}",
          style: AppStyles.white20Bold.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
