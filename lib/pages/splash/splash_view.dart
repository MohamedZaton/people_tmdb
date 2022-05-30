import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_tmdb/pages/home/home_view.dart';
import 'package:people_tmdb/tools/colors.dart';

import '../../widgets/flux_image.dart';
import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash";

  final logic = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 1.0;

    return Scaffold(
      backgroundColor: kbkgdDark,
      body: Container(
        alignment: Alignment.center,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 1),
          builder: (context, value, Widget? child) {
            return FluxImage(imageUrl: 'assets/images/title_logo.png');
          },
          child: FluxImage(imageUrl: 'assets/images/title_logo.png'),
          onEnd: () async {
            Get.offAll(() => HomePage());
          },
        ),
      ),
    );
  }
}
