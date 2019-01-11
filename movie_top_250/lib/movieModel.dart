class Movie {
  String id;
  String rating;
  String title;
  String director;
  String year;
  String poster;
  String summary;
  String shortReview = '我是一条短评';

  Movie(
      {this.id,
        this.rating,
        this.title,
        this.director,
        this.year,
        this.poster,
        this.summary});

  Movie.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.rating = json['rating']['average'].toString();
    this.title = json['title'];
    this.director = json['directors'][0]['name'];
    this.year = json['year'];
    this.poster =
        (json['images']['small'] as String).replaceAll('s_ratio', 'm_ratio');
    this.summary = json['summary'] ?? '';
  }
}

class MovieEnvelope {
  int count;
  int start;
  int total;
  List<Movie> movies;

  MovieEnvelope({this.count, this.start, this.total, this.movies});

  MovieEnvelope.fromJSON(Map data) {
    this.count = data['count'];
    this.start = data['start'];
    this.total = data['total'];
    List<Movie> movies = [];
    (data['subjects'] as List).forEach((item) {
      Movie movie = Movie.fromJSON(item);
      movies.add(movie);
    });
    this.movies = movies;
  }
}
