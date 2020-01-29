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



//class News{
//  String imageUrl;
//  String title;
//  String description;
//  String content;
//  String publishedAt;
//
//  int likes = 0;
//  bool liked = false;
//
//  List<String> commentsList = [
//    'comment 1',
//    'comment 2',
//  ];
//
//  News(this.imageUrl,this.title,this.description,this.content,this.publishedAt);
//
//  News.defaultNews(){
//    imageUrl = 'https://ichef.bbci.co.uk/images/ic/1024x576/p081cm3z.jpg';
//    title = 'Turkey earthquake: At least 21 dead as buildings collapse - BBC News';
//    description = 'At least 21 people are killed with more trapped under collapsed buildings after the 6.8 quake.';
//    content = 'Media captionRescuers in Turkey race against time to find more survivors\r\nAt least 21 people have been killed and more than 1,000 injured in a powerful earthquake in eastern Turkey.\r\nThe 6.8 magnitude quake, centred on the town of Sivrice in Elazig province, … [+2002 chars]';
//  }
//  factory News.fromJson(Map<String, dynamic> json) {
//    return News(json["urlToImage"],json["title"],json["description"],json["content"],json["publishedAt"]);
//  }
//}