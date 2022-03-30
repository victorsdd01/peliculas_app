import 'dart:convert';

class MViewedMovies {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MViewedMovies({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  get fullPoster => posterPath != null ? 'https://image.tmdb.org/t/p/original$posterPath' :  'https://via.placeholder.com/300x400';

  factory MViewedMovies.fromJson(String str) =>
      MViewedMovies.fromMap(json.decode(str));
  factory MViewedMovies.fromMap(Map<String, dynamic> data) => MViewedMovies(
    
    adult           : data["adult"], 
    genreIds        : List<int>.from(data["genre_ids"].map((x)=>x)), 
    id              : data["id"], 
    originalLanguage: data["original_language"], 
    originalTitle   : data["original_title"], 
    overview        : data["overview"], 
    popularity      : data["popularity"].toDouble(), 
    title           : data["title"], 
    video           : data["video"], 
    voteAverage     : data["vote_average"].toDouble(), 
    voteCount       : data["vote_count"],

  );
}
