import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/sura_details/widgets/sura_arabic_name_row.dart';
import 'package:islami/models/quran_name_verses.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String testText =
      "[1] بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ [2] الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ [3] الرَّحْمَنِ الرَّحِيمِ [4] مَالِكِ يَوْمِ الدِّينِ [5] إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ [6] اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ [7] صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين";

  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSura(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        titleTextStyle: AppStyles.yellow20Bold,
        leading: Icon(Icons.arrow_back, color: AppColors.yellowColor),
        title: Text(QuranNameVerses.englishQuranSurahsList[index]),
      ),
      body: Column(
        spacing: context.height * 0.012,
        children: [
          SuraArabicNameRow(index: index),
          Expanded(
            child:
                suraContent.isEmpty
                    ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      ),
                    )
                    : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.width * 0.02,
                          right: context.width * 0.02,
                        ),
                        child: Text(
                          suraContent,
                          style: AppStyles.yellow20Bold.copyWith(
                            height: context.height * 0.0029,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
          ),
          Image.asset(
            AppAssets.imgBottomDecoration,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
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
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
