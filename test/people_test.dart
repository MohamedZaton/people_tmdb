import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:people_tmdb/models/PeopleModel.dart';
import 'package:people_tmdb/services/people_public_request.dart';

void main() {
  group("people  request ", () {
    test(" get request", () async {
      Response response = await TmdbRequest().peopleGetRequest(page: 1);
      expect(response.statusCode, 200);
    });
    test("people list ", () async {
      List<PeopleModel>? peopleList = await TmdbRequest().peopleList();
      print("peopleList: ${peopleList.toString()}");
      expect(peopleList?.isNotEmpty, true);
    });
  });
}
