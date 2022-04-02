import 'dart:convert';

class Actors {
  String originalName;
  String? profilePath;

  Actors({required this.originalName, required this.profilePath});

  get fullActorImage => profilePath!=null ? 'https://image.tmdb.org/t/p/w500/$profilePath' : 'https://e7.pngegg.com/pngimages/858/581/png-clipart-profile-icon-user-computer-icons-system-chinese-wind-title-column-miscellaneous-service.png';
  

  factory Actors.fromJson(String str) => Actors.fromMap(jsonDecode(str));

  factory Actors.fromMap(Map<String, dynamic> actorData) => Actors(
        originalName: actorData["original_name"],
        profilePath: actorData["profile_path"],
      );
}
