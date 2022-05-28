import 'package:dio/dio.dart';
import 'package:people_tmdb/models/PeopleModel.dart';

import '../tools/constants.dart';
import '../utils/PaginationFilter.dart';

class TmdbRequest {
  String apiToken =
      "fba98756c2eba531f9fc710c5a2dc378"; // you can take api-key in this link https://www.themoviedb.org/
  String baseUrl = kBaseUrl;

  String url(int page) =>
      "$baseUrl/3/person/popular?api_key=$apiToken&language=en-US&page=$page";

  Future<Response> peopleGetRequest({
    int page = 1,
  }) async {
    Response response = await Dio().get(url(page));

    return response;
  }

  Future<List<PeopleModel>?> peopleList({
    PaginationFilter? filter,
  }) async {
    Response response = await peopleGetRequest(page: filter?.page ?? 1);
    final List result = response.data["results"];

    return result
        .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
