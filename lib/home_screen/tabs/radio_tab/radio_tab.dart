import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/radio_tab/widgets/radio_container.dart';
import 'package:islami/home_screen/tabs/radio_tab/widgets/tab_bar_switcher_radio.dart';
import 'package:islami/models/name_of_radio_perfomers.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.0465),
      child: Column(
        spacing: context.height * 0.018,
        children: [
          TabBarSwitcherRadio(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return RadioContainer(
                  name: NameOfRadioPerformers().nameOfPerformers[index],
                );
              },
              itemCount: NameOfRadioPerformers().nameOfPerformers.length,
            ),
          ),
        ],
      ),
    );
  }
}
