import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';
import 'package:movie_top_250/View/movieDetailWidget.dart';

Widget buildListRow(int index, Movie movie, BuildContext context) {
  // TODO: 这样的跳转是根据布局进行的，如果布局未充满，则跳转失效
  return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailWidget(movie: movie)));
      },
      child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildRank(index),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    moviePoster(movie),
                    _buildTextContent(movie),
                  ]
              ),
            ],
          )
      )
  );
}

Widget moviePoster(Movie movie) {
  return new Container(
    width: 100,
    height: 150,
    decoration: new BoxDecoration(
      image: DecorationImage(image: NetworkImage(movie.poster)),
      borderRadius: new BorderRadius.all(
        const Radius.circular(8.0),
      ),
    ),
  );
}

Widget _buildRank(int index) {
  index += 1;
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
    child: DecoratedBox(
        child: Padding(
            padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
            child: Text('No.$index',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 14,
                    fontWeight: FontWeight.w600))),
        decoration: new BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)))),
  );
}

Widget _buildTextContent(Movie movie) {
  return new Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(movie),
        _buildRatingStar(movie),
        _buildDetails(movie),
      ],
    ),
  );
}

Widget _buildPlayer() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
    child: Icon(
        Icons.play_circle_outline,
        color: Colors.deepOrange,
        size: 23
    ),
  );
}

Widget _buildTitle(Movie movie) {
  return new Row(
    children: <Widget>[
      _buildPlayer(),
      RichText(
        text: TextSpan(
            text: movie.title,
            style: new TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' (' + movie.year + ')',
                style: new TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
              )
            ]),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      )
    ],
  );
}

Widget _buildRatingStar(Movie movie) {
  List<Widget> icons = [];
  int fS = int.parse(movie.stars) ~/ 10;
  int f = 0;

  while (f < fS) {
    icons.add(new Icon(Icons.star, color: Colors.orange, size: 15));

    f++;
  }

  while (icons.length != 5) {
    icons.add(new Icon(Icons.star,
        color: Color.fromRGBO(220, 220, 220, 1), size: 15));
  }

  icons.add(new Padding(
    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    child: new Text(
      movie.rating,
      style: new TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(150, 150, 150, 1),
      ),
    ),
  ));

  return new Padding(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: new Row(children: icons),
  );
}

Widget _buildDetails(Movie movie) {
  var detailsString = '';

  detailsString = movie.director;

  detailsString += '/';
  for (String name in movie.genres) {
    detailsString += ' ' + name;
  }

  return new Container(
      //TODO: 这需要根据屏幕宽度进行设置
      width: 230.0,
      child: new Text(
        detailsString,
        softWrap: true,
        style: TextStyle(color: Color.fromRGBO(130, 130, 130, 1)),
      ));
}
