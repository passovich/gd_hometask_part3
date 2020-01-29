import 'package:flutter/cupertino.dart';

class NewsDescriptionWidget extends StatelessWidget{
  String _title;
  String _description;

  NewsDescriptionWidget(this._title,this._description);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child:
        RichText(
          text:TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: _title+': ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: _description,
                style: TextStyle(
                  fontSize: 14,
                )
              ),
            ],),
        )
      );
  }
}