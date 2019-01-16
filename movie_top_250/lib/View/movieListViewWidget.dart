import 'package:flutter/material.dart';
import 'package:movie_top_250/Service/movieApi.dart';
import 'package:movie_top_250/Model/movieModel.dart';
import 'package:movie_top_250/View/movieListViewRowWidget.dart';

class MovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DouBanMovieState();
  }
}

class _DouBanMovieState extends State<MovieWidget> {
  // 数据源
  List<Movie> movies = [];
  // 分页
  int page = 0;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣电影 Top250'),
      ),
      body: new RefreshIndicator(
        child: _buildList(),
        onRefresh: _requestData,
        color: Colors.black,
      ),
    );
  }

  // 下拉刷新
  Future<Null> _requestData() async {
    movies.clear();
    await MovieAPI().getMovieList(0).then((moviesData) {
      setState(() {
        movies = moviesData.movies;
      });
    });
    return;
  }

  // 上拉加载
  _requestMoreData(int page) {
    print('page = $page');
    MovieAPI().getMovieList(page).then((moviesData) {
      setState(() {
        movies += moviesData.movies;
      });
    });
  }

  // body List Widget
  Widget _buildList() {
    if (movies.length != 0) {
      return ListView.separated(
          itemBuilder: (context, index) {
            // 还剩 15 条数据的时去拉取新数据
            if (movies.length - index == 15) {
              _requestMoreData(++page);
            }
            return buildListRow(index, movies[index], context);
          },
          separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
          itemCount: movies.length);
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
