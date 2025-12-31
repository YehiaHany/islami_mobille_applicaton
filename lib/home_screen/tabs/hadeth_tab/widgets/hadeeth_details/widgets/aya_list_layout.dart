import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import 'aya_container.dart';

class AyaListLayout extends StatelessWidget {
  List<String> ayaList;

  AyaListLayout({super.key, required this.ayaList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: context.width * 0.02,
        right: context.width * 0.02,
      ),
      itemCount: ayaList.length,
      itemBuilder: (context, index) {
        return AyaContainer(aya: "[${index + 1}] ${ayaList[index]}");
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.height * 0.0091);
      },
    );
  }
}
