import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/services/movie_service.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/ui/movies/bloc/movies_event.dart';
import 'package:progress_follower/ui/movies/bloc/movies_state.dart';
import 'package:progress_follower/utils/enums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitialState());

  @override
  String toString() {
    return "MoviesBloc";
  }

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is GetMoviesEvent) {
      yield SearchingMoviesState();
      try {
        List<Movie> _movies = await getMovies(event.filter, event.page);
        yield MoviesFoundState(
          movieList: _movies,
          filterType: event.filter,
          reset: event.reset,
        );
      } catch (error, stacktrace) {
        print("Error: $error");
        print("$stacktrace");
        yield MoviesErrorState(error: error);
      }
    }
  }

  Future<List<Movie>> getMovies(FilterType filter, int page) async {
    Completer _completer = Completer<List<Movie>>();
    switch (filter) {
      case FilterType.trending:
        getTrendingMovies(page).then((value) => _completer.complete(value));
        break;
      default:
        getTrendingMovies(page).then((value) => _completer.complete(value));
    }
    return _completer.future;
  }

  Future<List<Movie>> getTrendingMovies(int page) {
    Completer _completer = Completer<List<Movie>>();
    MovieService().trending({"page": page}).then((response) {
      if (response != null) {
        List<Movie> movies = [];
        response.forEach((element) => movies.add(element.movie));
        _completer.complete(movies);
      } else {
        _completer.completeError("Movies not found");
      }
    }).catchError((error) => _completer.completeError(error));
    return _completer.future;
  }
}
