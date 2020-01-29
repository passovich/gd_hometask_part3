import 'package:flutter/material.dart';

class RoundRectangleConteiner extends StatelessWidget {
  Widget _child;
  Color _color;
  RoundRectangleConteiner({@required Widget child,Color color = Colors.black12}){
    _child = child;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: _color,
        border: Border.all(
          color: _color,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: _child,
    );
  }
}