import 'package:peliculas_app/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  static const String urlBase = 'api.themoviedb.org';
  static const String apiKeu = 'b72c453a4a2f4e171546caae79f1247f';
  static const String languaje = 'es-ES';

  List<Movie> onDisplaymovies = [];

  MoviesProvider() {
    getMovies();
  
  }

  getMovies() async {
    var url = Uri.https(urlBase, '3/movie/now_playing',
        {'api_key': apiKeu, 'language': languaje, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    //print(nowPlayingResponse.results[0].title);

    //se basa en el modelo y agrega
    onDisplaymovies = nowPlayingResponse.results;

    notifyListeners();
  }

  //obtener peliculas populares

}
