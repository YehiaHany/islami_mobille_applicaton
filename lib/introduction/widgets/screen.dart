import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class Screen extends StatelessWidget {
  String imgPath;
  String title;
  String body;
  late double titleSpacer;

  Screen({
    super.key,
    required this.imgPath,
    required this.title,
    this.body = '',
  });

  @override
  Widget build(BuildContext context) {
    titleSpacer =
        body.isNotEmpty
            ? MediaQuery.of(context).size.height * 0.04
            : MediaQuery.of(context).size.height * 0.1;
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.28),
        Image.asset(imgPath),
        SizedBox(height: titleSpacer),
        // SizedBox(height: 39,),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Janna',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.yellowColor,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Text(
          textAlign: TextAlign.center,
          body,
          style: TextStyle(
            fontFamily: 'Janna',
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: AppColors.yellowColor.withOpacity(0.85),
          ),
        ),
      ],
    );
  }
}
