import 'package:flutter/cupertino.dart';
import 'package:grid_first_dz/block/block_provider.dart';
import 'package:grid_first_dz/block/fetch_news_block.dart';
import 'package:flutter/material.dart';
import 'title_bar.dart';
import 'package:grid_first_dz/data/news.dart';
import 'news_widget.dart';
import 'buttons_bar.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    var bloc = BlocProvider.of<NewsBlock>(context);
    bloc.fetchNews();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        bloc.fetchNews();
        print('End of list, loading new page');
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('GD - Hometask part 3'),),
      body: buildBody(context),
    );
  }
  Widget buildBody(BuildContext context){
    var bloc = BlocProvider.of<NewsBlock>(context);
    bloc.fetchNews();

    return StreamBuilder<List<News>>(
      stream: bloc.newsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildNewsList(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget _buildNewsList(List<News> list){
    return
      Column(
        children: <Widget>[
          TitleBar(),
          Expanded(
            child: Container(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index){
                  return Container(child: NewsWidget(list[index]));
                },),
            ),
          ),
          Buttons(),
        ],
      );
  }
}
