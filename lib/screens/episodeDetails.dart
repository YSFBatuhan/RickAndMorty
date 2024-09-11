import 'dart:convert';
import 'package:deneme/models/character_model.dart';
import 'package:deneme/models/episode_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EpisodeDetailsPage extends StatefulWidget {
  final String episodeUrl;
  final List<String> characters;
  final EpisodeModel episode;

  EpisodeDetailsPage({
    super.key,
    required this.episodeUrl,
    required this.characters,
    required this.episode,
  });

  @override
  State<EpisodeDetailsPage> createState() => _EpisodeDetailsPageState();
}

List<Color> renkler = [
  Color(0xFFB3E5FC),
  Color(0xFFF5F5F5),
  Color(0xFFC8E6C9),
  Color(0xFFE1BEE7),
  Color(0xFFFFF9C4),
  Color(0xFFF8BBD0),
  Color(0xFFFFF59D),
  Color(0xFFFFE0B2),
  Color(0xFFD1C4E9),
  Color(0xFFB2DFDB),
  Color(0xFFFFF2B2),
  Color(0xFFC4E4E7),
  Color(0xFFB3E5FC),
  Color(0xFFF5F5F5),
  Color(0xFFC8E6C9),
  Color(0xFFE1BEE7),
  Color(0xFFFFF9C4),
  Color(0xFFF8BBD0),
  Color(0xFFFFF59D),
  Color(0xFFFFE0B2),
  Color(0xFFD1C4E9),
  Color(0xFFB2DFDB),
  Color(0xFFFFF2B2),
  Color(0xFFC4E4E7)
];

class _EpisodeDetailsPageState extends State<EpisodeDetailsPage> {
  late Future<List<CharacterModel>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _charactersFuture = getDetails4Character();
  }

  Future<List<CharacterModel>> getDetails4Character() async {
    final List<String> characterUrls = widget.characters;
    final List<Future<CharacterModel>> characterFutures =
        characterUrls.map((url) async {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return CharacterModel.fromMap(data);
      } else {
        throw Exception("Failed to load character details");
      }
    }).toList();

    final List<CharacterModel> characters = await Future.wait(characterFutures);
    return characters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.episode.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Episode: ${widget.episode.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Center(child:Text("Characters",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<CharacterModel>>(
              future: _charactersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No characters found"));
                } else {
                  final characters = snapshot.data!;
                  return PageView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      final character = characters[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: renkler[index],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                character.image != null
                                    ? CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(character.image),
                                        radius: 80,
                                      )
                                    : SizedBox(height: 200),
                                SizedBox(height: 8),
                                Text(
                                  character.name,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  character.species ?? 'Unknown species',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Status: ${character.status}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 8), // Space below PageView
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Additional Episode Details Here',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),Text("I dont have enough info right now :(")
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
