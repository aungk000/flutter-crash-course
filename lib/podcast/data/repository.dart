import '../model/episode.dart';
import '../model/podcast.dart';

class Repository {
  static List<Podcast> podcasts = [
    Podcast(1, 'Tim Sneath Taks Tips & Takeaways'),
    Podcast(2, 'Eric Seidel Educates'),
    Podcast(3, 'Martin Aguinis Masters')
  ];

  static List<Episode> episodes = [
    Episode(1, 1, "Product Management Tips for Common Man"),
    Episode(2, 1, "My Takeaway"),
    Episode(3, 1, "Talking Tech Tips"),
    Episode(4, 2, "Evolving Engineering"),
    Episode(5, 2, "Impressing External Engineers"),
    Episode(6, 2, "An Engineer Evening"),
    Episode(7, 3, "The Meaning Behind"),
    Episode(8, 3, "Marketing"),
    Episode(9, 3, "Making Mockups"),
  ];

  static List<Episode> loadEpisodes(int podcastId) {
    return episodes.where((e) => e.podcastId == podcastId).toList();
  }

  static Podcast loadPodcast(int id) {
    return podcasts.singleWhere((p) => p.id == id);
  }
}
