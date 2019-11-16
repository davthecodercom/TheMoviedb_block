import 'package:flutter/material.dart';
import 'package:themoviedb_flutter_bloc/blocs/movies_bloc.dart';
import 'package:themoviedb_flutter_bloc/models/movies/movie_item.dart';

class MovieList extends StatefulWidget {

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MoviesBloc();
    bloc.getPopularMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.popularMovies,
        builder: (context, AsyncSnapshot<MovieItem> snapshot) {
          if(snapshot.hasData) {
            return buildMovieList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildMovieList(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            childAspectRatio: 0.7
          ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: null,//() => openDetailPelicula(context, snapshot.data.results[index]),
            )
            // child: Text('${snapshot.data.results[index].title}'),
          );
        }
    );
  }

  // openDetailPelicula(BuildContext context, [Results result]) {
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(builder: (context) {
  //       return MovieDetail(
  //         posterUrl: result.backdrop_path, 
  //         description: result.overview, 
  //         releaseDate: result.release_date, 
  //         title: result.title, 
  //         voteAverage: result.vote_average, 
  //         movieId: result.id
  //       );
  //     })
  //   );
  // }

}