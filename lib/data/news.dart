import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()

class News{
  News(this.imageUrl,this.title,this.description,this.content,this.publishedAt);

  List<String> commentsList = [
    'comment 1',
    'comment 2',
  ];
  int likes = 10;
  bool liked = false;

  @JsonKey(name: 'urlToImage')
  String imageUrl;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'content')
  String content;
  @JsonKey(name: 'publishedAt')
  String publishedAt;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}