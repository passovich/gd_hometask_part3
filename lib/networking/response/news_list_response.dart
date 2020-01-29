import 'package:grid_first_dz/data/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse{
  NewsListResponse();

  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'totalResults')
  int totalResults;
  @JsonKey(name: 'articles')
  List <News> news;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) => _$NewsListResponseFromJson(json);
  Map <String, dynamic> toJson() => _$NewsListResponseToJson(this);

}