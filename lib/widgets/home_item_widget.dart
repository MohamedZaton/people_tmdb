import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:people_tmdb/models/home_item_model.dart';
import 'package:people_tmdb/utils/screens.dart';
import 'package:people_tmdb/widgets/flux_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeItemWgt extends StatelessWidget {
  final HomeItemModel homeItemModel;
  final int index;
  const HomeItemWgt({
    Key? key,
    required this.homeItemModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 1),
          blurRadius: 2.0,
        ),
      ]),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _launchURL(homeItemModel.htmlGoPath!);
          },
          child: index.isOdd
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// main pic 1
                    Expanded(flex: 2, child: Pic(homeItemModel.iconPath!, ctx)),

                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: ScreenWeb.width(ctx) * 0.1,
                      ),
                    ),

                    /// main info 1
                    Expanded(
                      flex: 2,
                      child: Info(
                        homeItemModel: homeItemModel,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// main info 2
                    Expanded(
                      flex: 2,
                      child: Info(
                        homeItemModel: homeItemModel,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: ScreenWeb.width(ctx) * 0.1,
                      ),
                    ),

                    /// main pic 2
                    Expanded(flex: 2, child: Pic(homeItemModel.iconPath!, ctx)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget Pic(String imagePath, BuildContext ctx) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FluxImage(
          imageUrl: homeItemModel.iconPath!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

_launchURL(String urlValue) async {
  String url = urlValue;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/// info  App
class Info extends StatelessWidget {
  final HomeItemModel homeItemModel;

  Info({
    required this.homeItemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> techIcons = homeItemModel.tech!.map((img) {
      return FluxImage(
        imageUrl: img,
        fit: BoxFit.fill,
      );
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          children: [
            Text(
              homeItemModel.titleApp!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: ScreenWeb.heigth(context) * 0.02,
        ),
        Text(
          homeItemModel.details!,
          style: Theme.of(context).textTheme.subtitle1,
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
        SizedBox(
          height: ScreenWeb.heigth(context) * 0.01,
        ),
      ],
    );
  }
}

/// tech icons
