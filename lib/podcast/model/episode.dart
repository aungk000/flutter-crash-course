import 'podcast.dart';

class Episode {
  int id;
  int podcastId;
  String title;
  bool isPlaying;

  Episode(this.id, this.podcastId, this.title, {this.isPlaying = false});
}