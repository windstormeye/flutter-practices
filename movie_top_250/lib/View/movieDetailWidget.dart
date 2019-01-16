import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';


class MovieDetailWidget extends StatelessWidget {

  MovieDetailWidget({this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie.title),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}