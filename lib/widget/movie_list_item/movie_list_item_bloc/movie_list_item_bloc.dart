import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/services/image_service.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item_bloc/movie_list_item_event.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item_bloc/movie_list_item_state.dart';

class MovieListItemBloc extends Bloc<MovieListItemEvent, MovieListItemState> {
  MovieListItemBloc() : super(MovieListItemInitialState());

  @override
  Stream<MovieListItemState> mapEventToState(MovieListItemEvent event) async* {
    if (event is GetMovieListItemImageEvent) {
      yield MovieListItemImageSearchingState();
      try {
        TmdbImage image;
        await Future.wait([
          getImages(event.tmdbId, "en").then((value) {
            return image = value;
          }).then((_) {
            if (image.posters == null ||
                image.posters.isEmpty ||
                image.backdrops == null ||
                image.backdrops.isEmpty) {
              getImages(event.tmdbId, null).then((value) {
                if (image.posters == null || image.posters.isEmpty) {
                  image.posters = value.posters;
                }
                if (image.backdrops == null || image.backdrops.isEmpty) {
                  image.backdrops = value.backdrops;
                }
              });
            }
          })
        ]);
        yield MovieListItemImageFoundState(image: image);
      } catch (error) {
        yield MovieListItemImageSearchErrorState(
          error: error,
          tmdbId: event.tmdbId,
        );
      }
    }
  }

  Future<TmdbImage> getImages(int tmdbId, String language) {
    Completer completer = Completer<TmdbImage>();
    ImageService().movie(tmdbId, language).then((res) {
      if (res != null) {
        completer.complete(res);
      } else {
        completer.completeError("Getting image failed for $tmdbId");
      }
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
