import 'package:flutter/material.dart';
import 'package:movie_top_250/View/movieListViewRowWidget.dart';
import 'package:movie_top_250/Model/movieModel.dart';

Widget movieDetailHeaderWidget(Movie movie) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        moviePoster(movie)
      ],
    ),
  );

}