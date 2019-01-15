import 'dart:io';
import 'dart:convert';
import 'package:movie_top_250/movieModel.dart';

class MovieAPI {
  Future<Movies> getMovieList(int start) async {
    var client = HttpClient();
    int page = start * 50;
    var request = await client.getUrl(Uri.parse(
        'https://api.douban.com/v2/movie/top250?start=$page&count=50'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return Movies.fromJSON(data);
  }
}