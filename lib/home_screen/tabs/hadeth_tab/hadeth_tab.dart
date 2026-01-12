import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/hadeth_tab/widgets/hadeeth_container.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: context.height * 0.695,
        aspectRatio: 313 / 618,
        enlargeCenterPage: true,
      ),
      items:
          List.generate(50, (index) => index + 1).map((index) {
            return Builder(
              builder: (BuildContext context) {
                return HadeethContainer(index: index);
              },
            );
          }).toList(),
    );
  }
}
