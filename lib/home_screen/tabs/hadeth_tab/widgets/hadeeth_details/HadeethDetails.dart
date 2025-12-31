import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/models/haddeth_details_args.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HadeethDetails extends StatefulWidget {
  HadeethDetails({super.key});

  @override
  State<HadeethDetails> createState() => _HadeethDetailsState();
}

class _HadeethDetailsState extends State<HadeethDetails> {
  @override
  Widget build(BuildContext context) {
    HadeethDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as HadeethDetailsArgs;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        titleTextStyle: AppStyles.yellow20Bold,
        leading: IconButton(
          color: AppColors.yellowColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Hadeeth ${args.index}"),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.detailsFullBackgroundBottomImage,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            spacing: context.height * 0.012,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: context.width * 0.02,
                  right: context.width * 0.02,
                  top: context.height * 0.018,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.leftYellowCorner),
                    Text(
                      " الحديث${args.hadeeth.title}",
                      style: AppStyles.yellow24Bold,
                    ),
                    Image.asset(AppAssets.rightYellowCorner),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.width * 0.02,
                      right: context.width * 0.02,
                    ),
                    child: Text(
                      args.hadeeth.content,
                      style: AppStyles.yellow20Bold.copyWith(
                        height: context.height * 0.0024,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.114),
            ],
          ),
          // selectedTabIndex == 1 && ayaList.isEmpty ||
          //     selectedTabIndex == 2 && suraContent.isEmpty
          //     ? Center(
          //   child: CircularProgressIndicator(color: AppColors.yellowColor),
          // )
          //     : SizedBox(),
        ],
      ),
    );
  }
}
