import 'package:flutter/material.dart';
import 'movies_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      home: MoviesList(),
    );
  }
}