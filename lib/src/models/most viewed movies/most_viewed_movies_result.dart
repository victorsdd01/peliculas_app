import 'dart:convert';
import '../models.dart';

class MostViewedMoviesResult {
  int page;
  List<MViewedMovies> results;
  int totalPages;
  int totalResults;

  MostViewedMoviesResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MostViewedMoviesResult.fromJson(String str) =>
      MostViewedMoviesResult.fromMap(jsonDecode(str));

  factory MostViewedMoviesResult.fromMap(Map<String,dynamic> data) => MostViewedMoviesResult(
    page        : data["page"], 
    results     : List<MViewedMovies>.from(data["results"].map((x)=> MViewedMovies.fromMap(x))), 
    totalPages  : data["total_pages"], 
    totalResults: data["total_results"], 
  );
}
