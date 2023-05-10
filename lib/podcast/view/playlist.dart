import 'package:flutter/material.dart';
import '../model/scoped_playlist.dart';
import 'component/episode_list.dart';
import 'component/player.dart';
import 'package:scoped_model/scoped_model.dart';

class Playlist extends StatelessWidget {
  final ScopedPlaylist playlist;

  const Playlist({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist'),),
      body: ScopedModel<ScopedPlaylist>(
        model: playlist,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EpisodeList(callback: (e) => playlist.setSelectedEpisode(e)),
            const Player()
          ],
        ),
      ),
    );
  }
}