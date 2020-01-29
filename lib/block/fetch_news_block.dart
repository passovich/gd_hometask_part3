import 'dart:async';
import 'package:grid_first_dz/data/news.dart';
import 'base_bloc.dart';
import 'package:grid_first_dz/networking/repository.dart';


class NewsBlock extends Bloc{
  final _repo = Repo.instance;

  final _newsListStream = StreamController<List<News>>();

  Stream<List<News>> get newsStream => _newsListStream.stream;

  void fetchNews()async {
    var response = await _repo.fetchNews('ua',1);
    _newsListStream.sink.add(response.news);
  }
  @override
  void dispose(){
    _newsListStream.close();
  }
}

