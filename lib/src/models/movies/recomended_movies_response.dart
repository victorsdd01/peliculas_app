import 'dart:convert';

import '../models.dart';

class RecomendedMoviesResponse {

  
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  RecomendedMoviesResponse(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory RecomendedMoviesResponse.fromJson(String str) =>
      RecomendedMoviesResponse.fromMap(jsonDecode(str));

  factory RecomendedMoviesResponse.fromMap(Map<String, dynamic> data) =>
      RecomendedMoviesResponse(
        page        : data["page"], 
        results     : List<Movie>.from(data["results"].map((x)=> Movie.fromMap(x))), 
        totalPages  : data["total_pages"], 
        totalResults: data["total_results"],
      );
}
