import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_tmdb/tools/colors.dart';
import 'package:people_tmdb/widgets/flux_image.dart';

class WebBarWidget extends StatelessWidget {
  const WebBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FluxImage(
            imageUrl: "assets/images/title_logo.png",
            width: 200,
            height: 100,
          ),
          Row(
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  if (Get.isDarkMode)
                    Get.changeThemeMode(ThemeMode.light);
                  else
                    Get.changeThemeMode(ThemeMode.dark);
                },
                child: Icon(
                  Icons.wb_sunny_outlined,
                  size: 14,
                ),
                backgroundColor: kIconBgColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
