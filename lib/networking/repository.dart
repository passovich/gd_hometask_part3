import 'package:grid_first_dz/networking/api.dart';
import 'package:grid_first_dz/networking/response/news_list_response.dart';
import 'package:dio/dio.dart';

const String theNewsDBApiKey = '27d0754b351e4f3886839fbdcbb2c14b';

class Repo{

  static final Repo instance = Repo._internal();
  Dio _dioClient = Dio();
  RestClient _restClient;

  Repo._internal(){
    _restClient = RestClient(_dioClient);
  }

  Future<NewsListResponse> fetchNews(String country,int pageSize, int pageNumber) async =>
      await _restClient.getTasks(country,pageSize,pageNumber,theNewsDBApiKey );
}
