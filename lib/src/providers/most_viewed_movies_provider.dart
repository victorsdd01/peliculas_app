import 'package:peliculas_app/src/models/models.dart';
import 'package:peliculas_app/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/src/providers/movie_provider.dart';

class MostViewedMovieprovider extends ChangeNotifier {
  String urlBase = MoviesProvider.urlBase;
  String apiKey = MoviesProvider.apiKeu;
  String language = MoviesProvider.languaje;

  List<Movie> mostViewedMovies = [];

  MostViewedMovieprovider() {
    getMostViewedMoviwes();
  }

  getMostViewedMoviwes() async {
    var url = Uri.https(urlBase, '3/movie/top_rated',
        {'api_key': apiKey, 'language': language, 'page': '1'});

    final response = await http.get(url);
    final mostVM = MostViewedMoviesResult.fromJson(response.body);
    mostViewedMovies = mostVM.results;

    notifyListeners();
  }
}
