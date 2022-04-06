import 'dart:convert';

import 'package:peliculas_app/src/models/models.dart';

class SearchMovieResponse {
  SearchMovieResponse(
      { this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  List<Movie> results;
  int? page;
  int totalPages;
  int totalResults;

  factory SearchMovieResponse.fromJson(String str) =>
      SearchMovieResponse.fromMap(jsonDecode(str));

  factory SearchMovieResponse.fromMap(Map<String, dynamic> data) =>
      SearchMovieResponse(
      page:         data["page"], 
      results:      List<Movie>.from(data["results"].map((x)=> Movie.fromMap(x))), 
      totalPages:   data["total_pages"], 
      totalResults: data["total_results"],
      );
}
