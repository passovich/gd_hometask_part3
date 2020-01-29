import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget{

  @override
  createState()=>TitleBarState();
}

class TitleBarState extends State<TitleBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_back_ios,size: 25,)),
            ],),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Grid Dynamics - press',style: TextStyle(fontSize: 12,)),
                  Text ('World news',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ],),
            ),
          )
        ],
      ),
    );
  }
}