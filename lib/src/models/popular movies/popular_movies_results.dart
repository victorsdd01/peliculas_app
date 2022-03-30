// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:peliculas_app/src/models/popular%20movies/popular_movies.dart';

class PopularMoviesResults{
  
   int page;
   List<PopularMovies> results;
   int totalPages;
   int totalResults;

  //se crea el constructor....
  PopularMoviesResults({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesResults.fromJson(String str) => PopularMoviesResults.fromMap(json.decode(str));

  factory PopularMoviesResults.fromMap(Map<String,dynamic> Json) => PopularMoviesResults(
    page        : Json["page"], 
    results     : List<PopularMovies>.from(Json["results"].map((x)=>PopularMovies.fromMap(x))), 
    totalPages  : Json["total_pages"], 
    totalResults: Json["total_results"],
  );
}
