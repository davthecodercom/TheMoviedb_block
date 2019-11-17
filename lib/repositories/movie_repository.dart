import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';
import 'package:themoviedb_flutter_bloc/models/videos/video_item.dart';
import 'package:themoviedb_flutter_bloc/providers/movie_api_provider.dart';

class MovieRepository {
  final movieApiProvider = MovieApiProvider();

  Future<MovieItem> get getPopularMovies => movieApiProvider.getPopularMovies();

  Future<VideoItem> getVideos(int movieId) => movieApiProvider.getVideos(movieId);
}
