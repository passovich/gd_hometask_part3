import 'package:flutter/material.dart';
import 'comments_screen.dart';
import 'package:grid_first_dz/data/news.dart';

class LikeButtons extends StatefulWidget{
  News _item;

  LikeButtons(this._item);

  @override
  createState()=>LikeButtonsState(_item);
}

class LikeButtonsState extends State<LikeButtons>{
  News _item;

  LikeButtonsState(this._item);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Row(children: <Widget>[
             IconButton(
               icon: Icon(_item.liked ? Icons.favorite_border : Icons.favorite,size: 30,),
             ),
             IconButton(
               icon: Icon(Icons.chat_bubble_outline, size: 30,),
               onPressed: ()=>_navigateToComments(context),
             ),
             IconButton(icon: Icon(Icons.near_me,size: 30)),
             Expanded(child: Container()),
                 IconButton(icon: Icon(Icons.bookmark_border,size: 30,))
          ],),
          Center(child: IconButton(icon: Icon (Icons.more_horiz,size: 30),) )
    ],);
  }
  void _navigateToComments(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommentsScreen(_item)));
  }
}