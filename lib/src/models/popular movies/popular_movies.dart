import 'dart:convert';

class PopularMovies {

   String? posterPath;
   bool? adult;
   String overview;
   String? releaseDate;
   List<int> genreIds;
   int id;
   String originalTitle;
   String originalLanguaje;
   String title;
   String backdropPath;
   double popularity;
   int voteCount;
   bool video;
   double voteAverage;

  PopularMovies({
    this.posterPath,
    this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguaje,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });


  get fullUrl=> posterPath != null ? 'https://image.tmdb.org/t/p/original$posterPath' :  'https://via.placeholder.com/300x400';

  factory PopularMovies.fromJson(String str) => PopularMovies.fromMap(jsonDecode(str));

  factory PopularMovies.fromMap(Map<String, dynamic> data) => PopularMovies(
    adult           : data["adult"],
    backdropPath    : data["backdrop_path"], 
    genreIds        : List<int>.from(data["genre_ids"].map((x)=>x)), 
    id              : data["id"], 
    originalLanguaje: data["original_language"], 
    originalTitle   : data["original_title"], 
    overview        : data["overview"], 
    popularity      : data["popularity"].toDouble(), 
    posterPath      : data["poster_path"],
    releaseDate     : data["release_date"], 
    title           : data["title"], 
    video           : data["video"], 
    voteAverage     : data["vote_average"].toDouble(), 
    voteCount       : data["vote_count"], 
  );
}
