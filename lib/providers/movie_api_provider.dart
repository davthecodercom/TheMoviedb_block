

import 'dart:convert';
import 'package:http/http.dart';
import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';

class MovieApiProvider {
  final String _baseUrl = "https://api.themoviedb.org/3/movie/";
  final String _apiKey = "?api_key=95368c18d545c274ddca891ecc68a426";
  final Client http = Client();

  Future<MovieItem> getPopularMovies() async {
    final response = await http.get("${_baseUrl}popular$_apiKey");

    bool _isValidResponse(int statusCode) {
      return statusCode == 200;
    }

    if(_isValidResponse(response.statusCode)) {
      return MovieItem.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception("Error to get popular movies");
    }
  }
}
