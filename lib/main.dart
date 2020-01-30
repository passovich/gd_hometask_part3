import 'package:flutter/material.dart';
import 'ui/home_page_screen.dart';
import 'block/block_provider.dart';
import 'block/fetch_news_block.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: NewsBlock(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(1,false),
      ),
    );
  }
}