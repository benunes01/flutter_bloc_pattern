import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/videos_bloc.dart';
import 'package:flutter_bloc_pattern/screens/api.dart';
import 'package:flutter_bloc_pattern/screens/home.dart';

void main() {
  Api api = Api();
  api.search("futparodias");
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: MaterialApp(
        title: 'FlutterTube',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}