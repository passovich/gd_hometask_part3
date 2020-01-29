import 'package:flutter/material.dart';
import 'package:grid_first_dz/data/news.dart';
import 'decoration_widgets/round_rectangle_container.dart';

class CommentsInputWidget extends StatefulWidget {
  News _item;

  CommentsInputWidget(this._item);

  @override
  State<StatefulWidget> createState() {
    return CommentWidgetState(_item);
  }
}

class CommentWidgetState extends State<CommentsInputWidget> {
  News _item;
  final TextEditingController eCtrl = TextEditingController();

  CommentWidgetState(this._item);

  @override
  Widget build (BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white10,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: <Widget>[
              Text('Your comment: ', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: TextField(
                  controller: eCtrl,
                  onSubmitted: (text) {
                    _item.commentsList.add(text);
                    eCtrl.clear();
                    setState(() {});
                  },
                ),
              ),
          ],),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _item.commentsList.length,
            itemBuilder: (BuildContext context, int index) {
              return RoundRectangleConteiner(
                color: Colors.white10,
                child: Text(
                  '$index: '+_item.commentsList[index],
                  softWrap: true,
                )
              );
            }
          )
        ),
    ],);
  }
}