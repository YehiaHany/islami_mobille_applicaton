import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.blackColor.withOpacity(0.7),
        hintText: "Sura Name",
        hintStyle: AppStyles.white16Bold,
        // prefixIconConstraints: BoxConstraints(
        //   minHeight: context.height * 0.03,
        //   minWidth: context.width * 0.06,
        // ),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 16, right: 12),
          child: SvgPicture.asset(AppAssets.quranSearchIcon,),
        ),
        enabledBorder: textFieldOutlineInputBorderStyle(),
        focusedBorder: textFieldOutlineInputBorderStyle(),
      ),
    );
  }

  OutlineInputBorder textFieldOutlineInputBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: AppColors.yellowColor),
    );
  }
}
