import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/services/image_service.dart';
import 'package:progress_follower/client/services/movie_service.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';
import 'package:progress_follower/ui/movie_information/bloc/movie_information_event.dart';
import 'package:progress_follower/ui/movie_information/bloc/movie_information_state.dart';
import 'package:progress_follower/utils/variables.dart';
import 'package:recase/recase.dart';

class MovieInformationBloc
    extends Bloc<MovieInformationEvent, MovieInformationState> {
  MovieInformationBloc() : super(MovieInfoInitialState());

  @override
  Stream<MovieInformationState> mapEventToState(
      MovieInformationEvent event) async* {
    if (event is LoadMovieInformationPageEvent) {
      yield MovieInformationPageLodingState();
      try {
        List<Future> futures = [];
        Movie movie;
        TmdbImage tmdbImage;
        futures.addAll([
          getMovieDetails(event.movie).then((value) => movie = value),
          getMovieImage(event.movie, "en")
              .then((value) => tmdbImage = value)
              .then((_) {
            if (tmdbImage.posters == null ||
                tmdbImage.posters.isEmpty ||
                tmdbImage.backdrops == null ||
                tmdbImage.backdrops.isEmpty) {
              getMovieImage(event.movie, null).then((value) {
                if (tmdbImage.posters == null || tmdbImage.posters.isEmpty) {
                  tmdbImage.posters = value.posters;
                }
                if (tmdbImage.backdrops == null ||
                    tmdbImage.backdrops.isEmpty) {
                  tmdbImage.backdrops = value.backdrops;
                }
              });
            }
          })
        ]);
        await Future.wait(futures);
        movie.image = tmdbImage;
        movie.genres = movie.genres.map((e) => ReCase(e).titleCase).toList();
        yield MovieInformationPageLoadedState(movie: movie);
      } catch (error) {
        yield MovieInformationPageLoadErrorState(error: error);
      }
    }
  }

  Future<Movie> getMovieDetails(Movie movie) {
    Completer completer = Completer<Movie>();
    String slug = movie.ids.slug;
    Map<String, dynamic> parameters = {
      ParameterKeys.extended: ParameterValues.full
    };
    MovieService()
        .summary(slug, parameters)
        .then((value) => completer.complete(value))
        .catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<TmdbImage> getMovieImage(Movie movie, String language) {
    Completer completer = Completer<TmdbImage>();
    int tmdbId = movie.ids.tmdb;
    ImageService()
        .movie(tmdbId, language)
        .then((value) => completer.complete(value))
        .catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
