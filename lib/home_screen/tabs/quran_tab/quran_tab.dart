import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/most_recently_container.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/search_text_field.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/suras_list/sura_list_tile.dart';
import 'package:islami/models/quran_name_verses.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.0465),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.height * 0.0232,
        children: [
          SearchTextField(),
          Text("Most Recently", style: AppStyles.white16Bold),
          SizedBox(
            height: context.height * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MostRecentlyContainer();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: context.width * 0.024);
              },
              itemCount: 2,
            ),
          ),
          Text("Suras List", style: AppStyles.white16Bold),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(child: SuraListTile(index: index));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.0113,
                  ),
                  child: Divider(
                    height: 1,
                    indent: context.width * 0.118,
                    endIndent: context.width * 0.09,
                  ),
                );
              },
              itemCount: QuranNameVerses.arabicAuranSuraslist.length,
            ),
          ),
        ],
      ),
    );
  }
}
