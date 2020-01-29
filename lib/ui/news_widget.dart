import 'dart:ui';
import 'package:grid_first_dz/data/news.dart';
import 'package:flutter/material.dart';
import 'package:grid_first_dz/ui/news_description_widget.dart';
import 'package:grid_first_dz/ui/tags_bar.dart';
import 'decoration_widgets/round_rectangle_container.dart';
import 'like_buttons_bar.dart';
import 'like_bar.dart';
import 'news_detail_screen.dart';

class NewsWidget extends StatelessWidget {
  final News _item;

  NewsWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return RoundRectangleConteiner(
      color: Color(0xff7c94b6),
      child: Container (
        child: Column(
          children:<Widget>[
            GestureDetector(
              child: Image.network(_item.imageUrl,width: double.infinity,fit: BoxFit.fitWidth,),
              onTap: () => _navigateToDetail(context),
            ),
            LikeButtons(_item),
            LikeBar(_item),
            NewsDescriptionWidget(_item.title,_item.description),
            TagsBar(),
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(children: <Widget>[
                Text(
                  _item.publishedAt,
                  style: TextStyle(fontSize: 11,),
                ),
              ],),
            )
        ],),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewsDetailScreen(_item)));
  }
}
