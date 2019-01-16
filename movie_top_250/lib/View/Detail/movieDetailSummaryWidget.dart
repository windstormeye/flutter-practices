import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';

Widget movieDetailSummaryWidget(MovieDetail movieDetail) {
  return new Padding(
    padding: EdgeInsets.all(15),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: new Text(
            '简介',
            style: new TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ),
        new Text(
          movieDetail.summary,
          style: new TextStyle(
              color: Colors.white,
              fontSize: 15,
          )
        )
      ],
    )
  );
}