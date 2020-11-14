import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';

abstract class MovieListItemState extends Equatable {}

class MovieListItemInitialState extends MovieListItemState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieListItemImageSearchingState extends MovieListItemState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieListItemImageFoundState extends MovieListItemState {
  final TmdbImage image;

  MovieListItemImageFoundState({@required this.image});

  @override
  List<Object> get props => [image];
}

class MovieListItemImageSearchErrorState extends MovieListItemState {
  final dynamic error;
  final int tmdbId;

  MovieListItemImageSearchErrorState({
    @required this.error,
    @required this.tmdbId,
  });

  @override
  List<Object> get props => [error, tmdbId];
}
