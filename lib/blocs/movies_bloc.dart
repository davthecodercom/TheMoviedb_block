import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';
import 'package:themoviedb_flutter_bloc/repositories/movie_repository.dart';

class MoviesBloc {
  final _movieRepository = MovieRepository();
  final _movies = PublishSubject<MovieItem>();

  Observable<MovieItem> get popularMovies => _movies.stream;
  
  getPopularMovies() async {
    MovieItem movieItem = await _movieRepository.getPopularMovies;
    _movies.sink.add(movieItem);
  }

  dispose() {
    _movies.close();
  }
  
}