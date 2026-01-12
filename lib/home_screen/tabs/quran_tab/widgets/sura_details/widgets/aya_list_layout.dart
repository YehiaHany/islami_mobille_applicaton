import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/utils.dart';

import 'aya_container.dart';

class AyaListLayout extends StatefulWidget {
  List<String> ayaList;
  String suraName;

  AyaListLayout({super.key, required this.ayaList, required this.suraName});

  @override
  State<AyaListLayout> createState() => _AyaListLayoutState();
}

class _AyaListLayoutState extends State<AyaListLayout> {
  int number = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNumber();
  }

  Future<void> getNumber() async {
    number = await getAyaNo(widget.suraName);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: context.width * 0.02,
        right: context.width * 0.02,
      ),
      itemCount: widget.ayaList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              if (number == index) {
                number = -1;
              }
              else {
                number = index;
              }
              setAyaNo(number, widget.suraName);
              setState(() {

              });
            },
            child: AyaContainer(aya: "[${index + 1}] ${widget.ayaList[index]}",
              index: index,
              selectedIndex: number,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.height * 0.0091);
      },
    );
  }
}
