import 'package:peliculas_app/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _urlBase = 'api.themoviedb.org';
  final String _apiKeu = 'b72c453a4a2f4e171546caae79f1247f';
  final String _languaje = 'es-ES';

  List<Movie> onDisplaymovies = [];

  MoviesProvider() {
    getMovies();
  }

  getMovies() async {
    var url = Uri.https(_urlBase, '3/movie/now_playing',
        {'api_key': _apiKeu, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    //print(nowPlayingResponse.results[0].title);

    //se basa en el modelo
    onDisplaymovies = nowPlayingResponse.results;
    
    notifyListeners();
  }
}
