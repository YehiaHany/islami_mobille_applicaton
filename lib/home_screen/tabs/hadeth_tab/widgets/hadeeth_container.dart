import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/hadeth_tab/widgets/title_row.dart';
import 'package:islami/models/hadeeth.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class HadeethContainer extends StatefulWidget {
  int index;

  HadeethContainer({super.key, required this.index});

  @override
  State<HadeethContainer> createState() => _HadeethContainerState();
}

class _HadeethContainerState extends State<HadeethContainer> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeth(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      // width: 500,
      decoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              AppAssets.hadethContainerBackgroundImage,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          hadeeth == null ? TitleRow(title: "") : SizedBox(),
          hadeeth == null
              ? Center(
                child: CircularProgressIndicator(color: AppColors.blackColor),
              )
              : Column(
                children: [
                  TitleRow(title: " الحديث${hadeeth!.title}"),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print("here");
                      },
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.04,
                        ),
                        scrollDirection: Axis.vertical,
                        child: Text(
                          hadeeth!.content,
                          style: AppStyles.black16Bold,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * 0.1),
                ],
              ),
        ],
      ),
    );
  }

  void loadHadeth(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/hadeeth/h$index.txt",
    );
    int firstLineSpace = fileContent.indexOf("\n");
    String title = fileContent.substring(0, firstLineSpace);
    String content = fileContent.substring(firstLineSpace);
    title = title.substring(title.indexOf("ث") + 1);
    hadeeth = Hadeeth(title: title, content: content);
    await Future.delayed(Duration(milliseconds: 400));
    if (!mounted) return;
    setState(() {});
  }
}
