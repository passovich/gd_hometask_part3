import 'dart:async';

import 'package:grid_first_dz/data/news.dart';
import 'package:grid_first_dz/networking/repository.dart';
import 'package:rxdart/subjects.dart';
import 'base_bloc.dart';

class NewsBlock extends Bloc{
  final _repo = Repo.instance;
  int _page = 1;
  int _pageSize = 5;
  String defCountry = 'gb';

  final _newsListStream = BehaviorSubject<List<News>>();

  NewsBlock(){
    _newsListStream.sink.add([]);
  }

  Stream<List<News>> get newsStream => _newsListStream.stream;

  void fetchNews(String country) async {
    var news = await _repo.fetchNews(country,_pageSize,_page++);
    _newsListStream.value.addAll(news.news);
    _newsListStream.sink.add(_newsListStream.value);
    print('country = '+country);
  }

  void clear(){
    _page=1;
    _newsListStream.sink.add([]);
  }
  @override
  void dispose(){
    _newsListStream.close();
  }
}

