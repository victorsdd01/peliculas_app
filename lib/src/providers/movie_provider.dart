import 'package:peliculas_app/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  static const String urlBase = 'api.themoviedb.org';
  static const String apiKey = 'b72c453a4a2f4e171546caae79f1247f';
  static const String language = 'es-ES';

  List<Movie> onDisplaymovies = [];
  List<Movie> mostViewedMovies = [];
  List<Movie> pMovies = [];

  MoviesProvider() {
    getMovies();
    getMostViewedMoviwes();
    getPopularMovies();
  }

  Future<String> _makeRequest(String undercodepath, [int page = 1]) async {
    var url = Uri.https(urlBase, undercodepath,
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
    final request = await _makeRequest('3/movie/popular');
    final popularMovies = PopularMoviesResults.fromJson(request);
    pMovies = popularMovies.results;
    notifyListeners();
  }

  //obtener peliculas populares

}
