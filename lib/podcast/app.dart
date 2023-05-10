import 'package:flutter/material.dart';
import 'data/repository.dart';
import 'model/episode.dart';
import 'model/podcast.dart';
import 'model/scoped_playlist.dart';
import 'view/playlist.dart';

class PodcastApp extends StatelessWidget {
  const PodcastApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ScopedPlaylist playlist = ScopedPlaylist();
    for(Episode e in Repository.episodes) {
      playlist.addEpisode(e);
    }

    return MaterialApp(
      title: 'Podcast Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Playlist(playlist: playlist,),
    );
  }
}