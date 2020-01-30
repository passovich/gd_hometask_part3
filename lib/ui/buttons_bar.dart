import 'package:flutter/material.dart';
import 'package:grid_first_dz/ui/home_page_screen.dart';

class Buttons extends StatefulWidget{
  BuildContext context;
  int _countryId;

  Buttons(this._countryId);

  @override
  createState()=>ButtonsState(_countryId);
}

class ButtonsState extends State<Buttons>{
  int _countryId = 1;
  var _country = ['ua','ru','us','gb','cn'];

  ButtonsState(this._countryId);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Text(
              'UA',
              style: TextStyle(fontWeight: _countryId == 0 ? FontWeight.bold:FontWeight.normal),
            ),
            iconSize: 30,onPressed: () => _navigateToHome(context,countryId: 0),),
          IconButton(
            icon: Text(
              'RU',
              style: TextStyle(fontWeight: _countryId == 1 ? FontWeight.bold:FontWeight.normal),
            ),
            iconSize: 30,onPressed: () => _navigateToHome(context,countryId: 1),),
          IconButton(
            icon: Text(
              'US',
              style: TextStyle(fontWeight: _countryId == 2 ? FontWeight.bold:FontWeight.normal),
            ),
            iconSize: 30,onPressed: () => _navigateToHome(context,countryId: 2),),
          IconButton(
            icon: Text(
              'GB',
              style: TextStyle(fontWeight: _countryId == 3 ? FontWeight.bold:FontWeight.normal),
            ),
            iconSize: 30,onPressed: () => _navigateToHome(context,countryId: 3),),
          IconButton(
            icon: Text(
              'CN',
              style: TextStyle(fontWeight: _countryId == 4 ? FontWeight.bold:FontWeight.normal),
            ),
            iconSize: 30,onPressed: () => _navigateToHome(context,countryId: 4),),
        ],
      ),
    );
  }

  void _navigateToHome(BuildContext context,{@required int countryId}) {
    this._countryId=countryId;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(countryId,true)));
  }
}