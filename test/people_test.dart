import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:people_tmdb/models/PeopleModel.dart';
import 'package:people_tmdb/services/app_api.dart';

void main() {
  group("people  request ", () {
    test(" get request", () async {
      Response response = await AppApi().peopleGetRequest(page: 1);
      expect(response.statusCode, 200);
    });
    test("people list ", () async {
      List<PeopleModel>? peopleList = await AppApi().peopleList();
      print("peopleList: ${peopleList.toString()}");
      expect(peopleList?.isNotEmpty, true);
    });
  });
}
