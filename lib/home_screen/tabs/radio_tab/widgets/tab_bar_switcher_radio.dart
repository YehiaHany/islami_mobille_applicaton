import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_styles.dart';

typedef setTabBar = void Function(int);

class TabBarSwitcherRadio extends StatefulWidget {
  setTabBar? func;

  TabBarSwitcherRadio({super.key, this.func});

  @override
  State<TabBarSwitcherRadio> createState() => _TabBarSwitcherRadioState();
}

class _TabBarSwitcherRadioState extends State<TabBarSwitcherRadio> {
  int switchIndex = 1;

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      clipBehavior: Clip.antiAlias,
      height: context.height * 0.045,
      innerPadding: EdgeInsets.zero,
      isStretch: true,
      fromMax: true,
      children: {
        1: Text(
          'Radio',
          textAlign: TextAlign.center,
          style:
              switchIndex == 1 ? AppStyles.black16Bold : AppStyles.white16Bold,
        ),
        2: Text(
          'Reciters',
          textAlign: TextAlign.center,
          style:
              switchIndex == 2 ? AppStyles.black16Bold : AppStyles.white16Bold,
        ),
      },
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      thumbDecoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(12),
      ),
      onValueChanged: (int value) {
        print(value);
        setState(() {
          switchIndex = value;
        });
      },
    );
  }
}
