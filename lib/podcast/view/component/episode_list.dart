import 'package:flutter/material.dart';
import '../../model/episode.dart';
import '../../model/scoped_playlist.dart';
import 'package:scoped_model/scoped_model.dart';

typedef EpisodeListItemCallback = void Function(Episode e);

class EpisodeList extends StatelessWidget {
  final EpisodeListItemCallback callback;

  const EpisodeList({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedPlaylist>(
        builder: (context, child, model) => Expanded(
                child: ListView(
              children: model.episodes.map((e) => _itemPlayList(e)).toList(),
            )));
  }

  Widget _itemPlayList(Episode e) {
    final subtitle = '${e.isPlaying ? '[PLAYING] ' : ''}${e.title}';

    return InkWell(
      onTap: () => callback(e),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          subtitle,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
