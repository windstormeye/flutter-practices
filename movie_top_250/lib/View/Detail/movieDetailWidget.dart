import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';
import 'package:movie_top_250/Service/movieApi.dart';
import 'package:movie_top_250/View/Detail/movieDetailHeaderWidget.dart';
import 'package:movie_top_250/View/Detail/movieDetailStarWidget.dart';
import 'package:movie_top_250/View/Detail/movieDetailSummaryWidget.dart';
import 'package:movie_top_250/View/Detail/movieDetailMemberWidget.dart';

class MovieDetailWidget extends StatefulWidget {
  @required final Movie movie;
  @required final int index;
  MovieDetailWidget({this.movie, this.index});

  @override
  State<StatefulWidget> createState() {
    return _movieDetailState(movie: movie, rankIndex: index);
  }
}

class _movieDetailState extends State<MovieDetailWidget> {
  @required Movie movie;
  @required int rankIndex;
  _movieDetailState({this.movie, this.rankIndex});

  // 数据源
  MovieDetail movieDetail;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(movie.title),
        ),
        backgroundColor: Color.fromRGBO(76, 49, 36, 1),
        body: _buildBody());
  }

  _requestData() {
    MovieAPI().getMovieDetail(this.movie.id).then((moviesData) {
      setState(() {
        movieDetail = moviesData;
      });
    });
  }

  Widget _buildBody() {
    // 数据源没来时展示 loading
    if (movieDetail == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new SingleChildScrollView(
        child: new Padding(
            padding: EdgeInsets.all(10),
            child: new Column(children: <Widget>[
              movieDetailHeaderWidget(rankIndex, movieDetail),
              movieDetailStarWidget(movieDetail),
              movieDetailSummaryWidget(movieDetail),
              movieDetailMemberWidget(movieDetail),
            ])
        ),
      );
    }
  }
}
