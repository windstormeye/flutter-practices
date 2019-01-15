import 'package:flutter/material.dart';
import 'package:movie_top_250/movieListViewWidget.dart';


void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影 Top250',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: DouBanMovieWidget(),
    );
  }
}

