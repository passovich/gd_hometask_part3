import 'dart:async';

import 'package:grid_first_dz/data/news.dart';
import 'package:grid_first_dz/networking/repository.dart';
import 'package:rxdart/subjects.dart';
import 'base_bloc.dart';

class NewsBlock extends Bloc{
  final _repo = Repo.instance;
  int _page = 1;

  final _newsListStream = BehaviorSubject<List<News>>();

  NewsBlock(){
    _newsListStream.sink.add([]);
  }

  Stream<List<News>> get newsStream => _newsListStream.stream;

  void fetchNews() async {
    var news = await _repo.fetchNews('us',_page++);
    _newsListStream.value.addAll(news.news);
    _newsListStream.sink.add(_newsListStream.value);
    print("fetchNews page=$_page");
  }

  @override
  void dispose(){
    _newsListStream.close();
  }
}
