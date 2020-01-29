import 'package:flutter/material.dart';

class Buttons extends StatefulWidget{
  @override
  createState()=>ButtonsState();
}

class ButtonsState extends State<Buttons>{
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: Icon(Icons.home,size: 30,)),
          IconButton(icon: Icon(Icons.search,size: 30,)),
          IconButton(icon: Icon(Icons.add_circle_outline,size: 30,)),
          IconButton(icon: Icon(Icons.favorite_border,size: 30)),
          Image.network(
            'https://v.fastcdn.co/u/c67c6bbe/47349885-0-r-kostricin.png',
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}