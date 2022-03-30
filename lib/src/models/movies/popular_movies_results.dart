// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../models.dart';

class PopularMoviesResults{
  
   int page;
   List<Movie> results;
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
    results     : List<Movie>.from(Json["results"].map((x)=>Movie.fromMap(x))), 
    totalPages  : Json["total_pages"], 
    totalResults: Json["total_results"],
  );
}
