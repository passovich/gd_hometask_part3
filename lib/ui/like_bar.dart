import 'package:flutter/material.dart';
import 'package:grid_first_dz/data/news.dart';

class LikeBar extends StatefulWidget{
  News _item;

  LikeBar (this._item);

  @override
  createState()=>LikeBarState(_item.likes);
}

class LikeBarState extends State<LikeBar>{
  int _likes;

  LikeBarState (this._likes);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image.network('https://v.fastcdn.co/u/c67c6bbe/47349885-0-r-kostricin.png',width: 20,height: 20,fit: BoxFit.fill,),
      Expanded(child:
        Row(
          children: <Widget>[
            Text(
              ' Liked by ',
              style: TextStyle(fontSize: 14,),
            ),
            Text(
              'Roman Kostritsin ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'and ',
              style: TextStyle(fontSize: 14,),
            ),
            Text(
              '$_likes'+' others',
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
            ),
          ],
        )
      ),
    ],);
  }
}