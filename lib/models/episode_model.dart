import 'dart:convert';

class EpisodeModel {
  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
  });

  final String id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map["id"].toString(),
      name: map["name"] ?? "",
      airDate: map["air_date"] ?? "",
      episode: map["episode"] ?? "",
      characters: List<String>.from(map["characters"] ?? []),
      url: map["url"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "air_date": airDate,
      "episode": episode,
      "characters": characters,
      "url": url,
    };
  }
}
