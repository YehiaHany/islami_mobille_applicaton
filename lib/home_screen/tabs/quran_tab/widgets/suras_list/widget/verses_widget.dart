import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        SvgPicture.asset(AppAssets.vectorIcon, width: 70),
        Text(
          "${index + 1}",
          style: AppStyles.white20Bold.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
