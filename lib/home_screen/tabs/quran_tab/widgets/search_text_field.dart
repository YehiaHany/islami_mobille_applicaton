import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

typedef searchFunction = void Function(String);

class SearchTextField extends StatelessWidget {
  searchFunction func;
  TextEditingController textEditingController;

  SearchTextField({
    super.key,
    required this.func,
    required this.textEditingController,
  })@override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        func(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.blackColor.withOpacity(0.7),
        hintText: "Sura Name",
        hintStyle: AppStyles.white16Bold,
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
