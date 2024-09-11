import 'dart:convert';
import 'package:deneme/models/episode_model.dart';
import 'package:deneme/screens/episodeDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeasonOne extends StatelessWidget {
  String SeasonOneApi = "https://rickandmortyapi.com/api/episode";
  Future<List<EpisodeModel>> getInfoEpisode() async {
    final response = await http.get(Uri.parse(SeasonOneApi));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => EpisodeModel.fromMap(json)).toList();
    } else {
      throw Exception("olmadıı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 1"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getInfoEpisode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No characters found"),
            );
          } else {
            final SeasonOne = snapshot.data!;
            return ListView.builder(
                itemCount: SeasonOne.length,
                itemBuilder: (context, index) {
                  final episode = SeasonOne[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EpisodeDetailsPage(episodeUrl: episode.url,characters: episode.characters,episode: episode,)));
                    },
                    child: ListTile(
                      title: Text(episode.name),
                      trailing: Column(
                        children: [
                          Text(episode.id),
                          Text(episode.airDate),
                    
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
/*
{
  "info": {
    "count": 51,
    "pages": 3,
    "next": "https://rickandmortyapi.com/api/episode?page=2",
    "prev": null
  },
  "results": [
    {
      "id": 1,
      "name": "Pilot",
      "air_date": "December 2, 2013",
      "episode": "S01E01",
      "characters": [
        "https://rickandmortyapi.com/api/character/1",
        "https://rickandmortyapi.com/api/character/2",
        "https://rickandmortyapi.com/api/character/35",
        "https://rickandmortyapi.com/api/character/38",
        "https://rickandmortyapi.com/api/character/62",
        "https://rickandmortyapi.com/api/character/92",
        "https://rickandmortyapi.com/api/character/127",
        "https://rickandmortyapi.com/api/character/144",
        "https://rickandmortyapi.com/api/character/158",
        "https://rickandmortyapi.com/api/character/175",
        "https://rickandmortyapi.com/api/character/179",
        "https://rickandmortyapi.com/api/character/181",
        "https://rickandmortyapi.com/api/character/239",
        "https://rickandmortyapi.com/api/character/249",
        "https://rickandmortyapi.com/api/character/271",
        "https://rickandmortyapi.com/api/character/338",
        "https://rickandmortyapi.com/api/character/394",
        "https://rickandmortyapi.com/api/character/395",
        "https://rickandmortyapi.com/api/character/435"
      ],
      "url": "https://rickandmortyapi.com/api/episode/1",
      "created": "2017-11-10T12:56:33.798Z"
    },



*/