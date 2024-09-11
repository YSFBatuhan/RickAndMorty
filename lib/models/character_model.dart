import 'dart:convert';

class CharacterModel {
  final String id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String originName;
  final String locationName;
  final String image;
  final List<String> episode;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.originName,
    required this.locationName,
    required this.image,
    required this.episode
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      originName: map['origin']?['name'] ?? '',
      locationName: map['location']?['name'] ?? '',
      image: map['image'] ?? '',
      episode: List<String>.from(map["episode"].map((x) => x)),
    );
  }
}
