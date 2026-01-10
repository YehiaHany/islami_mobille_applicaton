import 'package:flutter/material.dart';
import 'package:islami/core/utils/device_dimensions.dart';
import 'package:islami/providers/most_recently_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import 'most_recently_container.dart';

class MostRecentlyWidget extends StatefulWidget {
  int filterSearchLength;
  ScrollController scrollController;

  MostRecentlyWidget({
    super.key,
    required this.filterSearchLength,
    required this.scrollController,
  });

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentlyProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //todo:this block of code will be executed after build
      mostRecentProvider.getMostRecently();
    });
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentlyProvider>(context);
    return Visibility(
      visible:
          widget.filterSearchLength == 114 &&
          mostRecentProvider.mostRecentlyListInt.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.height * 0.0232,
        children: [
          Text("Most Recently", style: AppStyles.white16Bold),
          SizedBox(
            height: context.height * 0.17,
            child: ListView.separated(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MostRecentlyContainer(
                  index: mostRecentProvider.mostRecentlyListInt[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: context.width * 0.024);
              },
              itemCount: mostRecentProvider.mostRecentlyListInt.length,
            ),
          ),
        ],
      ),
    );
  }
}
