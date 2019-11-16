import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';
import 'package:themoviedb_flutter_bloc/providers/movie_api_provider.dart';

class MovieRepository {
  final movieApiProvider = MovieApiProvider();

  Future<MovieItem> get getPopularMovies => movieApiProvider.getPopularMovies();
}
