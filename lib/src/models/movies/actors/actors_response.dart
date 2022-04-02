import 'dart:convert';

import 'package:peliculas_app/src/models/models.dart';

class ActorsResponse {
  List<Actors> cast;

  ActorsResponse({required this.cast});

  factory ActorsResponse.fromJson(String str) =>
      ActorsResponse.fromMap(jsonDecode(str));

  factory ActorsResponse.fromMap(Map<String, dynamic> data) => ActorsResponse(
    cast: List<Actors>.from(data["cast"].map((x) => Actors.fromMap(x)))
  );
}
