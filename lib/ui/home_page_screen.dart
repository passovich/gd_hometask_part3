import 'package:flutter/cupertino.dart';
import 'package:grid_first_dz/block/block_provider.dart';
import 'package:grid_first_dz/block/fetch_news_block.dart';
import 'package:flutter/material.dart';
import 'title_bar.dart';
import 'package:grid_first_dz/data/news.dart';
import 'news_widget.dart';
import 'buttons_bar.dart';

class HomeScreen extends StatefulWidget {
  int _countryId=1;
  bool resetPage=false;

  HomeScreen(this._countryId,this.resetPage);

  @override
  _HomeScreenState createState() => _HomeScreenState(_countryId,resetPage);
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int _countryId;
  var _country = ['ua','ru','us','gb','cn'];
  bool resetPage = false;

  _HomeScreenState(this._countryId,this.resetPage);

  @override
  void initState() {
    var bloc = BlocProvider.of<NewsBlock>(context);
    if (resetPage){bloc.clear();}
    bloc.fetchNews(_country[_countryId]);
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        bloc.fetchNews(_country[_countryId]);
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
    bloc.fetchNews(_country[_countryId]);

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
          Buttons(_countryId),
        ],
      );
  }
}
