import 'package:peliculas_app/src/models/models.dart';
import 'package:peliculas_app/src/pages/pages.dart';
import 'package:peliculas_app/src/providers/providers.dart';
import 'package:http/http.dart' as http;

class ActorsProvider extends ChangeNotifier {
  final String _urlBase = MoviesProvider.urlBase;
  final String _apiKey = MoviesProvider.apiKey;
  final String _language = MoviesProvider.language;

  List<Actors> actors = [];

  ActorsProvider();

  getActors(int movieId) async {
    final url = Uri.https(_urlBase, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    final actorsResponse = ActorsResponse.fromJson(response.body);
    actors = actorsResponse.cast;
    notifyListeners();
  }
}
