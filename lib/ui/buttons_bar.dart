import 'package:flutter/material.dart';
import 'package:grid_first_dz/ui/home_page_screen.dart';
import 'package:grid_first_dz/data/countries.dart';

class Buttons extends StatefulWidget{
  BuildContext context;
  int _countryId;

  Buttons(this._countryId);

  @override
  createState()=>ButtonsState(_countryId);
}

class ButtonsState extends State<Buttons>{
  int _countryId = 1;
  Countries countries = Countries();
  List<Widget> buttons=[];
  ButtonsState(this._countryId){getButtons();}

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black12,
      height: 50, width: double.infinity,
      child: ListView(children: buttons,scrollDirection: Axis.horizontal,)
    );
  }
  void getButtons (){
    for (int i=0;i<countries.country.length;i++){
      buttons.add(IconButton(
        icon: Text(
          countries.country[i],
          style: TextStyle(fontWeight: _countryId == i ? FontWeight.bold:FontWeight.normal),
        ),
        iconSize: 30,onPressed: () => _navigateToHome(context,countryId: i),
      ));
    }
  }
  void _navigateToHome(BuildContext context,{@required int countryId}) {
    this._countryId = countryId;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(countryId,true)));
  }
}