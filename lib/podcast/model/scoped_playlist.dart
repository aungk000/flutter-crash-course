import 'package:scoped_model/scoped_model.dart';
import 'episode.dart';

class ScopedPlaylist extends Model {
  List<Episode> episodes = [];
  Episode? selectedEpisode;

  void addEpisode(Episode episode) {
    episodes.add(episode);
    notifyListeners();
  }

  void setSelectedEpisode(Episode episode) {
    if(selectedEpisode != null) {
      selectedEpisode?.isPlaying = false;
    }
    selectedEpisode = episode;
    selectedEpisode?.isPlaying = true;
    notifyListeners();
  }
}