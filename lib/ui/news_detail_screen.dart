import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_first_dz/data/news.dart';
import 'package:grid_first_dz/ui/like_buttons_bar.dart';
import 'decoration_widgets/round_rectangle_container.dart';

class NewsDetailScreen extends StatelessWidget{
  final News _detail;

  NewsDetailScreen(this._detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_detail.title),),
      body: Center(
        child:
        RoundRectangleConteiner(
          color: Color(0xff7c94b6),
          child: Column(
            children: <Widget>[
              RoundRectangleConteiner(
                color: Colors.yellow,
                child:Text(
                  _detail.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)
                ) ,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Image.network(_detail.imageUrl,width: double.infinity,fit: BoxFit.fitWidth,)
              ),
              Expanded(
                child: RoundRectangleConteiner(
                  color: Colors.yellow,
                  child:Text(_detail.content == null ? 'No detailed content' : _detail.content,
                  ) ,
                ),
              ),
              LikeButtons(_detail),
            ],
          ),
        )
      ),
    );
  }
}