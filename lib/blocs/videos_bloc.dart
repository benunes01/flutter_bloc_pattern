import 'dart:async';
import 'package:flutter_bloc_pattern/models/video.dart';
import 'package:flutter_bloc_pattern/screens/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class VideosBloc implements BlocBase {
  Api api;

  List<Video> videos;

  final StreamController<List<Video>> _videosController = StreamController<List<Video>>();

  // Para ser acessível fora do bloc.
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();

  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if(search != null){
      // Se faz uma outra pesquisa depois de já ter pesquisado outra coisa, ele vai desfazer da lista que já tem primeiro.
      _videosController.sink.add([]);
      videos = await api.search(search);
    }
    else
      {
        api.nextPage();
      }
    videos += await api.search(search);

    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }



  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
