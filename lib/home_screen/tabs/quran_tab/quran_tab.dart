import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/most_recently_container.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/search_text_field.dart';
import 'package:islami/home_screen/tabs/quran_tab/widgets/suras_list/sura_list_tile.dart';
import 'package:islami/models/quran_name_verses.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  int filterSearchLength = 114;
  List<int> filterList = List.generate(114, (index) => index);
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.0465),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.height * 0.0232,
        children: [
          SearchTextField(
            func: search, textEditingController: _textEditingController,),
          filterSearchLength != 114
              ? SizedBox()
              : Text("Most Recently", style: AppStyles.white16Bold),
          filterSearchLength != 114
              ? SizedBox()
              : SizedBox(
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
            child:
            filterList.isEmpty
                ? Center(
              child: Text(
                "No Sura Item Found",
                style: AppStyles.white20Bold,
              ),
            )
                : ListView.separated(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.suraDetailsScreen,
                        arguments: filterList[index],
                      );
                      Future.delayed(Duration(milliseconds: 100), resetSearch);
                    },
                    child: SuraListTile(index: filterList[index]),
                  ),
                );
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
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void search(String value) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranNameVerses.englishQuranSurahsList.length; i++) {
      if (QuranNameVerses.englishQuranSurahsList[i].toLowerCase().contains(
        value.toLowerCase(),
      ) ||
          QuranNameVerses.arabicQuranSuraslist[i].contains(value)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    filterSearchLength = filterList.length;
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    setState(() {});
  }

  void resetSearch() {
    _textEditingController.text = "";
    search("");
    FocusManager.instance.primaryFocus?.unfocus(); // Unfocus the current field
  }
}
