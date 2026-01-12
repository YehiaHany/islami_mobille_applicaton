import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/sebha_tab/widgets/tasbeeh_text.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  String sobhanAllah = "سبحان الله";

  int count = 0;
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.height * 0.018,
      children: [
        // SizedBox(height: context.height*0.003,),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: AppStyles.white36Bold,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            count++;
            if (count == 31) {
              count = 0;
            }
            _turns += 1 / 30;
            setState(() {

            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              TasbeehText(tasbeeh: sobhanAllah, count: count),
              Column(
                children: [
                  Image.asset(AppAssets.sebhaHeadImage),
                  AnimatedRotation(turns: _turns,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(AppAssets.sebhaBodyImage),
                    curve: Curves.easeOut,
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
