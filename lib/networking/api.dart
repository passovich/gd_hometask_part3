import 'package:grid_first_dz/networking/response/news_list_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

part 'api.g.dart';

const String baseUrl = 'https://newsapi.org';
//endpoint
const String topHeadlines = '/v2/top-headlines';
const String everything = '/v2/everything';
const String sourcesEndPoint = '/v2/sources';

//query parameters
const String country = 'country';
const String category = 'category';
const String sources = 'sources';
const String q = 'q';
const String pageSize = 'pageSize';
const String page = 'page';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/v2/top-headlines")
  Future<NewsListResponse> getTasks(
      @Query('country') String country,
      @Query('pageSize') int pageSize,
      @Query('page') int page,
      @Query('apiKey') String apiKey,
      );
}

