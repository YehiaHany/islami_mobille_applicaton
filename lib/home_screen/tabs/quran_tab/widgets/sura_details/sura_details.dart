import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/widgets/aya_list_layout.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/widgets/mushaf_layout.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/widgets/sura_arabic_name_row.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../models/quran_name_verses.dart';
import 'widgets/tab_bar_switcher.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayaList = [];
  String suraContent = '';
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (ayaList.isEmpty && selectedTabIndex == 1) {
      getAyaList(index);
    }
    else if (suraContent.isEmpty && selectedTabIndex == 2) {
      loadSura(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.056),
          child: Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.02,
              right: context.width * 0.02,
            ),
            child: TabBarSwitcher(func: setTabIndex,),
          ),
        ),
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
        title: Text(QuranNameVerses.englishQuranSurahsList[index]),
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
              SuraArabicNameRow(index: index),
              selectedTabIndex == 1 && ayaList.isEmpty ||
                  selectedTabIndex == 2 && suraContent.isEmpty
                  ? SizedBox()
                  : Expanded(
                child:
                selectedTabIndex == 1
                    ? AyaListLayout(ayaList: ayaList)
                    : MushafLayout(suraContent: suraContent),
              ),
              SizedBox(height: context.height * 0.114),
            ],
          ),
          selectedTabIndex == 1 && ayaList.isEmpty ||
              selectedTabIndex == 2 && suraContent.isEmpty
              ? Center(
            child: CircularProgressIndicator(color: AppColors.yellowColor),
          )
              : SizedBox(),
        ],
      ),
    );
  }

  void loadSura(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/suras/${index + 1}.txt",
    );
    List<String> lines = fileContent.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] = "[${i + 1}] ${lines[i]}";
    }
    suraContent = lines.join();
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {});
  }

  void getAyaList(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/suras/${index + 1}.txt",
    );
    ayaList = fileContent.split("\n");
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {});
  }

  void setTabIndex(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
