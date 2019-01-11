import 'package:flutter/material.dart';
import 'package:movie_top_250/movieApi.dart';
import 'package:movie_top_250/movieModel.dart';



void main() => runApp(MyApp(movies: MovieAPI().getMovieList(0)));

class MyApp extends StatelessWidget {
  final Future<MovieEnvelope> movies;

  MyApp({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影 Top250',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('豆瓣电影 Top250'),
        ),
        body: Center(
          child: FutureBuilder<MovieEnvelope>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(snapshot.data.movies[5].title),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}