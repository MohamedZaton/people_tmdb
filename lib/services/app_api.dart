import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:people_tmdb/models/home_item_model.dart';

class AppApi {
  static Future<List<HomeItemModel>> fetchHomeItems() async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/projects_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<HomeItemModel> items = HomeItemModel.getListObject(jsonData);
    return items;
  }
}
