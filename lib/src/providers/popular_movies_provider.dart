import 'package:peliculas_app/src/pages/pages.dart';
import '../models/models.dart';
import 'providers.dart';
import 'package:http/http.dart' as http;

class PopularMoviesProvider extends ChangeNotifier {

  
  List<Movie> pMovies = [];

  PopularMoviesProvider() {
    getPopularMovies();
  }

  getPopularMovies() async {
    var url = Uri.https(MoviesProvider.urlBase, '3/movie/popular', {
      'api_key': MoviesProvider.apiKeu,
      'languaje': MoviesProvider.languaje,
      'page': '1'
    });

    final response = await http.get(url);
    final popularMovies = PopularMoviesResults.fromJson(response.body);
    pMovies = popularMovies.results;
    notifyListeners();
  }
}
