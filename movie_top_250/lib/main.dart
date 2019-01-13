import 'package:flutter/material.dart';
import 'package:movie_top_250/movieApi.dart';
import 'package:movie_top_250/movieModel.dart';

void main() => runApp(MyApp(movies: MovieAPI().getMovieList(0)));

class MyApp extends StatelessWidget {
  final Future<MovieEnvelope> movies;
  var page = 0;

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
        body: _buildList(),
      ),
    );
  }

  // body List Widget
  Widget _buildList() {
    return FutureBuilder<MovieEnvelope>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              // 加了分割线，长度需要为两倍
              itemCount: snapshot.data.movies.length * 2,
              itemBuilder: (context, index) {
                if (snapshot.data.movies.length - index < 10) {
                  MovieAPI().getMovieList(++page);
                }
                if (index.isOdd) {
                  //是奇数
                  return new Divider();
                } else {
                  index = index ~/ 2;
                  return _buildListRow(snapshot.data.movies[index]);
                }
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return new Center(
            child: new CircularProgressIndicator(
              backgroundColor: Colors.black
            )
        );
      },
    );
  }

  Widget _buildListRow(Movie movie) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: 100,
              height: 150,
              decoration: new BoxDecoration(
                image: DecorationImage(image: NetworkImage(movie.poster)),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: new BorderRadius.all(
                  const Radius.circular(8.0),
                ),
              ),
            ),
            _buildTextContent(movie),
          ]),
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

  Widget _buildTitle(Movie movie) {
    return new Row(
      children: <Widget>[
        new Text(
          movie.title,
          style: new TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        new Text(
          ' (' + movie.year + ')',
          style: new TextStyle(
            color: Color.fromRGBO(150, 150, 150, 1),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        )
      ],
    );
  }

  Widget _buildRatingStar(Movie movie) {
    List<Widget> icons = [];
    int fS = int.parse(movie.stars) ~/ 10;
    int f = 0;
    while (f < fS) {
      icons.add(new Icon(Icons.star, color: Colors.orange, size: 13));

      f++;
    }

    while (icons.length != 5) {
      icons.add(new Icon(Icons.star,
          color: Color.fromRGBO(220, 220, 220, 1), size: 13));
    }

    icons.add(new Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: new Text(
        movie.rating,
        style: new TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
      ),
    ));

    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
        child: new Text(detailsString,
          softWrap: true,
        )
    );
  }
}
