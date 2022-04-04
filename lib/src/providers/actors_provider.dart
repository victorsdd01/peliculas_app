// ignore_for_file: iterable_contains_unrelated_type

import 'package:peliculas_app/src/models/models.dart';
import 'package:peliculas_app/src/pages/pages.dart';
import 'package:peliculas_app/src/providers/providers.dart';
import 'package:http/http.dart' as http;

class ActorsProvider extends ChangeNotifier {
  final String _urlBase = MoviesProvider.urlBase;
  final String _apiKey = MoviesProvider.apiKey;
  final String _language = MoviesProvider.language;

  List<Actors> actors = [];

  Future<List<Actors>> getActors(int movieId) async {
    print('pidiendo la lista de actores..');
    //if(actors.containsKey(movieId)) return actors[movieId]!;
    final url = Uri.https(_urlBase, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    final actorsResponse = ActorsResponse.fromJson(response.body);
    actors = actorsResponse.cast;
    return actorsResponse.cast;
  }
}
