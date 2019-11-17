

import 'dart:convert';
import 'package:http/http.dart';
import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';
import 'package:themoviedb_flutter_bloc/models/videos/video_item.dart';

class MovieApiProvider {
  final int _validHttpCode = 200;
  final String _baseUrl = "https://api.themoviedb.org/3/movie";
  final String _apiKey = "?api_key=95368c18d545c274ddca891ecc68a426";
  final Client http = Client();

  bool _isValidResponse(int statusCode) {
    return statusCode == _validHttpCode;
  }

  Future<MovieItem> getPopularMovies() async {
    final response = await http.get("$_baseUrl/popular$_apiKey");

    if(_isValidResponse(response.statusCode)) {
      return MovieItem.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception("Error to get popular movies");
    }
  }

  Future<VideoItem> getVideos(int movieId) async {
    final response = await http.get("$_baseUrl/$movieId/videos$_apiKey");

    if(_isValidResponse(response.statusCode)) {
      return VideoItem.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception("Error on obtine the videos");
    }
  }

}
