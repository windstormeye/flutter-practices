class Movie {
  String id;
  String rating;
  String stars;
  String title;
  String director;
  String year;
  String poster;
  List<String> genres;

  Movie({
    this.id,
    this.rating,
    this.title,
    this.director,
    this.year,
    this.stars,
    this.poster,
    this.genres
  });

  Movie.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.rating = json['rating']['average'].toString();
    this.stars = json['rating']['stars'].toString();
    this.title = json['title'];
    this.director = json['directors'][0]['name'];
    this.year = json['year'];
    this.poster = json['images']['small'];
    this.genres = new List<String>.from(json['genres']);
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
