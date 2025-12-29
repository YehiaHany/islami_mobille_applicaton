import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/device_dimensions.dart';

typedef setTabBar = void Function(int);

class TabBarSwitcher extends StatefulWidget {
  setTabBar func;

  TabBarSwitcher({super.key, required this.func});

  @override
  State<TabBarSwitcher> createState() => _TabBarSwitcherState();
}

class _TabBarSwitcherState extends State<TabBarSwitcher> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      height: context.height * 0.045,
      innerPadding: EdgeInsets.zero,
      isStretch: true,
      fromMax: true,
      children: const {
        1: Text('Aya View', textAlign: TextAlign.center),
        2: Text('Mushaf View', textAlign: TextAlign.center),
      },
      decoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(12),
      ),
      thumbDecoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      onValueChanged: (int value) {
        widget.func(value);
      },
    );
  }
}
