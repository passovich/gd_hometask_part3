import 'package:flutter/material.dart';
import 'package:grid_first_dz/ui/comment_input_widget.dart';
import 'package:grid_first_dz/data/news.dart';
import 'decoration_widgets/round_rectangle_container.dart';

class CommentsScreen extends StatefulWidget{
  News _item;

  CommentsScreen(this._item);

  @override
  createState()=>CommentsScreenState(_item);
}

class CommentsScreenState extends State<CommentsScreen>{
  News _item;

  CommentsScreenState(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Comments'),),
        body:
        RoundRectangleConteiner(
          color: Color(0xff7c94b6),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  RoundRectangleConteiner(
                    color: Colors.yellow,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(_item.imageUrl,width:150,fit: BoxFit.fitWidth,),
                        Expanded(
                          child:Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text(
                              _item.description,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ) ,
                        ),
                    ],),
                  ),
                  Container(child: CommentsInputWidget(_item),height: 300,),
              ],),
          ],),
        )
    );
  }
}