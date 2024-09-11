import 'dart:convert';
import 'package:deneme/models/episode_model.dart';
import 'package:deneme/screens/episodeDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeasonTwo extends StatelessWidget {
  String SeasonOneApi = "https://rickandmortyapi.com/api/episode?page=2";
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
        title: Text("Season 2"),
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
                  return  InkWell(
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
