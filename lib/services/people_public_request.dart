import 'package:dio/dio.dart';
import 'package:people_tmdb/models/PeopleModel.dart';

String apiToken =
    ""; // you can take api-key in this link https://www.themoviedb.org/
String baseUrl = "https://api.themoviedb.org";

String url(String page) =>
    "$baseUrl/3/person/popular?api_key=$apiToken&language=en-US&page=$page";
Future<List<PeopleModel>?> peopleList(String page) async {
  Response response = await Dio().get(url(page));
  final List result = response.data;

  return result
      .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
