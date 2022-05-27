import 'package:flutter/material.dart';

class BackGroundWgt extends StatelessWidget {
  final String? imageBgPath;
  const BackGroundWgt({
    Key? key,
    this.imageBgPath = "assets/images/main_bkgd.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imageBgPath!),
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
