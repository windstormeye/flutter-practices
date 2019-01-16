
class MovieMember {
  String id;
  // 成员姓名
  String name;
  // 详情 URL
  String detailUrl;
  // 中清晰度头像
  String avatarUrl;

  MovieMember({
    this.name,
    this.detailUrl,
    this.avatarUrl,
  });

  MovieMember.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.avatarUrl = json['avatars']['medium'];
    this.detailUrl = json['alt'];
    this.name = json['name'];
  }
}

class MovieDetail {
  // 标题
  String title;
  // 上映年份
  String year;
  // 原名
  String originalTitle;
  // 所属国家或地区
  List<String> countries;
  // 评分
  String rating;
  // "想看"人数
  String wishCount;
  // 星星
  String stars;
  // 高清晰度海报
  String poster;
  // 电影类型
  List<String> genres;
  // 评分人数
  int ratingsCount;
  // 主要导演
  List<MovieMember> director;
  // 主要演员
  List<MovieMember> casts;
  // 简介
  String summary;

  MovieDetail({
    this.title,
    this.year,
    this.countries,
    this.rating,
    this.stars,
    this.poster,
    this.genres,
    this.ratingsCount,
    this.director,
    this.casts,
    this.summary,
    this.wishCount,
  });

  MovieDetail.fromJSON(Map<String, dynamic> json) {
    this.title = json['title'];
    this.year = json['year'];
    this.summary = json['summary'];
    this.poster = json['images']['large'];
    this.ratingsCount = json['ratings_count'];
    this.originalTitle = json['original_title'];
    this.wishCount = json['wish_count'].toString();

    this.rating = json['rating']['average'].toString();
    this.stars = json['rating']['stars'].toString();

    this.countries = new List<String>.from(json['countries']);
    this.genres = new List<String>.from(json['genres']);

    List<MovieMember> castsMembers = [];
    (json['directors'] as List).forEach((item) {
      MovieMember movieMember = MovieMember.fromJSON(item);
      castsMembers.add(movieMember);
    });
    this.director = castsMembers;

    List<MovieMember> directorMembers = [];
    (json['casts'] as List).forEach((item) {
      MovieMember movieMember = MovieMember.fromJSON(item);
      directorMembers.add(movieMember);
    });
    this.casts = directorMembers;
  }
}

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

class Movies {
  int count;
  int start;
  int total;
  List<Movie> movies;

  Movies({this.count, this.start, this.total, this.movies});

   Movies.fromJSON(Map data) {
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