import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';

Widget movieDetailHeaderWidget(int index, MovieDetail movieDetail) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildMoviePoster(movieDetail),
        _buildTextContent(index, movieDetail),
      ],
    ),
  );
}

Widget _buildMoviePoster(MovieDetail movieDetail) {
  return new Container(
    width: 110,
    height: 160,
    decoration: new BoxDecoration(
      image: DecorationImage(image: NetworkImage(movieDetail.poster)),
      borderRadius: new BorderRadius.all(
        const Radius.circular(8.0),
      ),
    ),
  );
}

Widget _buildTextContent(int index, MovieDetail movieDetail) {
  return new Container(
    width: 210,
    child: new Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitle(movieDetail),
                _buildOriginTitle(movieDetail),
                _buildBadge(index, movieDetail),
                _buildDetails(movieDetail),
              ],
            ),
            _buildButton(),
          ],
        )),
  );
}

Widget _buildTitle(MovieDetail movieDetail) {
  return new Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
    child: new Text(
      movieDetail.title,
      style: new TextStyle(fontSize: 22, color: Colors.white),
    ),
  );
}

Widget _buildOriginTitle(MovieDetail movieDetail) {
  return new Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: new Text(
        movieDetail.originalTitle + '(' + movieDetail.year + ')',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: new TextStyle(
            fontSize: 13, color: Colors.white, fontWeight: FontWeight.w700),
      ));
}

Widget _buildBadge(int index, MovieDetail movieDetail) {
  index++;
  return new Row(
    children: <Widget>[
      DecoratedBox(
          child: Padding(
              padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
              child: Text('No.$index',
                  style: TextStyle(color: Colors.brown, fontSize: 14))),
          decoration: new BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5)))),
      DecoratedBox(
          child: Padding(
              padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
              child: Text('豆瓣Top250',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 12))),
          decoration: new BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)))),
    ],
  );
}

Widget _buildDetails(MovieDetail movie) {
  var detailsString = '';

  for (String name in movie.countries) {
    detailsString += name + ' ';
  }

  detailsString += '/ ';
  for (String name in movie.genres) {
    detailsString += name + ' ';
  }

  return new Container(
      //TODO: 这需要根据屏幕宽度进行设置
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      width: 230.0,
      child: new Text(
        detailsString,
        softWrap: true,
        style: TextStyle(color: Color.fromRGBO(220, 220, 220, 1)),
      ));
}

Widget _buildButton() {
  return new Padding(
    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: new Row(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: new RaisedButton(
            onPressed: () {},
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: new Icon(
                    Icons.remove_red_eye,
                    size: 18,
                    color: Colors.orange,
                  )
                ),
                new Text('想看',
                  style: new TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textColor: Colors.black,
          ),
        ),
        new RaisedButton(
          onPressed: () {},
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: new Icon(
                    Icons.star_border,
                    size: 18,
                    color: Colors.orange,
                  )
              ),
              new Text('看过',
                style: new TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textColor: Colors.black,
        ),
      ],
    ),
  );
}
