import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:themoviedb_flutter_bloc/models/videos/video_item.dart';
import 'package:themoviedb_flutter_bloc/repositories/movie_repository.dart';

class MovieDetailBloc {
  final _movieRepository = MovieRepository();
  final _videos = PublishSubject<VideoItem>();

  Observable<VideoItem> get movieVideos => _videos.stream;

  dispose() {
    _videos.close();
  }

  getMovieVideosById(int movieId) async {
    VideoItem videos = await _movieRepository.getVideos(movieId);
    _videos.sink.add(videos);
  }
}