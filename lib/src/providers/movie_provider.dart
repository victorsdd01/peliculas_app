// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:peliculas_app/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import '../helpers/debouncer.dart';
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  static const String urlBase = 'api.themoviedb.org';
  static const String apiKey = 'b72c453a4a2f4e171546caae79f1247f';
  static const String language = 'es-ES';

  List<Movie> onDisplaymovies = [];
  List<Movie> mostViewedMovies = [];
  List<Movie> popular_movies = [];
  List<Movie> onRecomendedMovies = [];
  List<Movie> movieSearch = [];

  int _popularMovies = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    getMovies();
    getMostViewedMoviwes();
    getPopularMovies();
    //getRecomendedMovies();
  }

  Future<String> _makeRequest(String undercodepath, [int page = 1]) async {
    final url = Uri.https(urlBase, undercodepath,
        {'api_key': apiKey, 'language': language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getMovies() async {
    final request = await _makeRequest('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(request);
    onDisplaymovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getMostViewedMoviwes() async {
    final request = await _makeRequest('3/movie/top_rated');
    final mostVM = MostViewedMoviesResult.fromJson(request);
    mostViewedMovies = mostVM.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularMovies++;
    final request = await _makeRequest('3/movie/popular', _popularMovies);
    final popularMovies = PopularMoviesResults.fromJson(request);
    popular_movies = popularMovies.results;
    notifyListeners();
  }

  getRecomendedMovies(int lastId) async {
    final request = await _makeRequest('3/movie/$lastId/recommendations');
    final recomendedMovies = RecomendedMoviesResponse.fromJson(request);
    onRecomendedMovies = recomendedMovies.results;
    notifyListeners();
  }

  Future<List<Movie>> searchMovie(String movieName) async {
    final url = Uri.https(urlBase, '3/search/movie', {
      'api_key': apiKey,
      'language': language,
      'query': movieName,
      'page': '1',
    });
    final response = await http.get(url);
    final searcResult = SearchMovieResponse.fromJson(response.body);
    movieSearch = searcResult.results;
    return movieSearch;
  }

  void getSuggestionByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
       final result = await searchMovie(value);
       _suggestionStreamController.add(result);
      print(value);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

  //obtener peliculas populares

}
