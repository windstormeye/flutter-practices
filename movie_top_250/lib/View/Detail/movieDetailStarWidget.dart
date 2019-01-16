import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';


Widget movieDetailStarWidget(MovieDetail movieDetail) {
  return new DecoratedBox(
    decoration: new BoxDecoration(
        color: Color.fromRGBO(65, 46, 37, 1),
        borderRadius: BorderRadius.all(Radius.circular(5))),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.all(10),
                  child: new Text(
                    '豆瓣评分™',
                    style: TextStyle(color: Colors.white),
                  )
              )
            ],
          ),
          _buildRatingStar(movieDetail),
        ],
      )
  );
}

Widget _buildRatingStar(MovieDetail movieDetail) {
  List<Widget> icons = [];
  int fS = int.parse(movieDetail.stars) ~/ 10;
  int f = 0;

  while (f < fS) {
    icons.add(new Icon(Icons.star, color: Colors.orange, size: 15));
    f++;
  }
  while (icons.length != 5) {
    icons.add(new Icon(Icons.star,
        color: Color.fromRGBO(220, 220, 220, 1), size: 15));
  }

  return new Padding(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
    child: new Column(children: <Widget>[
      new Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
        child: new Text(
          movieDetail.rating,
          style: new TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(220, 220, 220, 1),
          ),
        ),
      ),
      new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons
      ),
    ]),
  );
}