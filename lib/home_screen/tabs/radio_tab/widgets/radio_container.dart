import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/device_dimensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RadioContainer extends StatefulWidget {
  String name;

  RadioContainer({super.key, required this.name});

  @override
  State<RadioContainer> createState() => _RadioContainerState();
}

class _RadioContainerState extends State<RadioContainer> {
  bool isMute = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.018),
      height: context.height * 0.1495,
      constraints: BoxConstraints(minHeight: 133),
      decoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
                isPause
                    ? SvgPicture.asset(
                      AppAssets.soundWaveIcon,
                      fit: BoxFit.fill,
                      color: Colors.black,
                    )
                    : Image.asset(AppAssets.radioItemMosque, fit: BoxFit.fill),
          ),
          Positioned(
            left: 0,
            right: 0,
            // top: 20,
            top: context.height * 0.0224,
            child: Column(
              // spacing: 10,
              spacing: context.height * 0.04,
              children: [
                Text(widget.name, style: AppStyles.black20Bold),
                Row(
                  spacing: context.width * 0.07,
                  // context.width*0.065
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      child: SvgPicture.asset(
                        AppAssets.playIcon,
                        color: AppColors.transparentColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPause = !isPause;
                        });
                      },
                      child: SvgPicture.asset(
                        isPause ? AppAssets.pauseIcon : AppAssets.playIcon,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMute = !isMute;
                        });
                      },
                      child: SvgPicture.asset(
                        isMute ? AppAssets.muteIcon : AppAssets.volumeIcon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
