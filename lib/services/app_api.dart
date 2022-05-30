import 'package:dio/dio.dart';
import 'package:people_tmdb/models/PeopleModel.dart';

import '../tools/constants.dart';
import '../utils/PaginationFilter.dart';
import 'local_data.dart';

class AppApi {
  String apiToken =
      "fba98756c2eba531f9fc710c5a2dc378"; // you can take api-key in this link https://www.themoviedb.org/
  String baseUrl = kBaseUrl;

  String peopleUrl(int page) =>
      "$baseUrl/3/person/popular?api_key=$apiToken&language=en-US&page=$page";

  /// not using
  String personUrl(int id) =>
      "$baseUrl/3/person/person/$id?api_key=$apiToken&language=en-US";

  /// not using
  //https://api.themoviedb.org/3/person/224513?api_key=fba98756c2eba531f9fc710c5a2dc378&language=en-US

  Future<Response> peopleGetRequest({
    int page = 1,
  }) async {
    Response response = await Dio().get(peopleUrl(page));

    return response;
  }

  Future<List<PeopleModel>?> peopleList({
    PaginationFilter? filter,
    bool isConnect = true,
  }) async {
    int pageNum = filter?.page ?? 1;
    if (isConnect) {
      try {
        Response response = await peopleGetRequest(page: pageNum);
        final List result = response.data[kResultsKey];
        //print("[app_api] result string: ${result.toString()}");
        LocalData().writeBackup(pageNum, result);
        return result
            .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (e) {
        return LocalData()
            .getBackup()
            .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } else {
      return LocalData()
          .getBackup()
          .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }
}
