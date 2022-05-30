import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FluxImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const FluxImage({
    required this.imageUrl,
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageProxy = '';
    if (kIsWeb) {
      String kImageProxy = 'https://cors.mstore.io/';

      imageProxy = kImageProxy;
    }
    if (imageUrl == null) {
      return Image.asset(
        "assets/images/user.png",
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }
    if (imageUrl.contains('http')) {
      return ExtendedImage.network(
        '$imageProxy$imageUrl',
        enableMemoryCache: true,
        width: width,
        height: height,
        fit: fit,
        color: color,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.loading:
            case LoadState.failed:
            default:
              return const SizedBox();
          }
        },
      );
    }
    if (imageUrl.contains('svg')) {
      return SvgPicture.asset(
        imageUrl,
        semanticsLabel: 'Acme Logo',
        width: width,
        height: height,
      );
    }

    return Image.asset(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
