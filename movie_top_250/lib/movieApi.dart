import 'dart:io';
import 'dart:convert';
import 'package:movie_top_250/movieModel.dart';

class MovieAPI {
  Future<MovieEnvelope> getMovieList(int start) async {
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse(
        'https://api.douban.com/v2/movie/top250?start=$start&count=100'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return MovieEnvelope.fromJSON(data);
  }
}