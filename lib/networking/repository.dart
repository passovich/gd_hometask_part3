import 'package:grid_first_dz/data/news.dart';
import 'package:grid_first_dz/networking/api.dart';
import 'package:grid_first_dz/networking/response/news_list_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

const String theNewsDBApiKey = '27d0754b351e4f3886839fbdcbb2c14b';

class Repo{

  static final Repo instance = Repo._internal();
  Dio _dioClient = Dio();
  RestClient _restClient;

  Repo._internal(){
    _restClient = RestClient(_dioClient);
  }

  Future<NewsListResponse> fetchNews(String Country, int pageNumber) async =>
      await _restClient.getTasks('us',20,2,theNewsDBApiKey );
}

//class Repo {
//  static final Repo _instance = Repo._internal();
//
//  factory Repo() {
//    return _instance;
//  }
//
//  Repo._internal();
//
//  Future<List<News>> fetchNews() async {
//    List<News> newsSubs;
//    String link =
//        "https://newsapi.org/v2/top-headlines?country=us&apiKey=27d0754b351e4f3886839fbdcbb2c14b";
//    var res = await http
//        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
//    print(res.body);
//    if (res.statusCode == 200) {
//      var data = json.decode(res.body);
//      var rest = data["articles"] as List;
//      print(rest);
//      newsSubs = rest.map<News>((json) => News.fromJson(json)).toList();
//    }
//    print("List Size: ${newsSubs.length}");
//    return newsSubs;
//  }
//
//}