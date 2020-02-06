import 'package:flutter/material.dart';
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
    // TODO: implement build
    return MaterialApp(
      title: 'FlutterTube',
      home: Home(),
    );
  }
}
