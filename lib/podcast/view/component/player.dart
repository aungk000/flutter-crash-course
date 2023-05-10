import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../data/repository.dart';
import '../../model/episode.dart';
import '../../model/scoped_playlist.dart';
import '../../model/podcast.dart';

class Player extends StatelessWidget {
  final height = 200.0;
  final textStyle = const TextStyle(color: Colors.white, fontSize: 18.0);

  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.all(8.0),
      child: ScopedModelDescendant<ScopedPlaylist>(
          builder: (context, child, model) => _player(model)),
    );
  }

  Widget _player(ScopedPlaylist model) {
    var label1 = '';
    var label2 = '';
    var label3 = '';

    if (model.selectedEpisode != null) {
      label1 = "Now playing...";
      Podcast podcast =
          Repository.loadPodcast(model.selectedEpisode!.podcastId);
      label2 = podcast.name;
      label3 = model.selectedEpisode!.title;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_textLabel(label1), _textLabel(label2), _textLabel(label3)],
    );
  }

  Widget _textLabel(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
