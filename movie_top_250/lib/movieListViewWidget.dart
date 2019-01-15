import 'package:flutter/material.dart';
import 'package:movie_top_250/movieApi.dart';
import 'package:movie_top_250/movieModel.dart';
import 'package:movie_top_250/movieListViewRowWidget.dart';


class DouBanMovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DouBanMovieState();
  }
}

class _DouBanMovieState extends State<DouBanMovieWidget> {
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
      return ListView.builder(
        // 加了分割线，长度需要为两倍
          itemCount: movies.length * 2,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              // 奇数
              return new Divider();
            } else {
              index = index ~/ 2;
              // 还剩 15 条数据的时去拉取新数据
              if (movies.length - index == 15) {
                _requestMoreData(++page);
              }
              return buildListRow(movies[index]);
            }
          });
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
