// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['urlToImage'] as String,
      json['title'] as String,
      json['description'] as String,
      json['content'] as String,
      json['publishedAt'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'urlToImage': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'publishedAt': instance.publishedAt
    };
