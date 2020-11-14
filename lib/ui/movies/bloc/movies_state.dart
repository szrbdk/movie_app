import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/utils/enums.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitialState extends MoviesState {
  @override
  List<Object> get props => null;
}

class SearchingMoviesState extends MoviesState {
  @override
  List<Object> get props => null;
}

class MoviesFoundState extends MoviesState {
  final List<Movie> movieList;
  final FilterType filterType;
  final bool reset;

  MoviesFoundState({
    @required this.movieList,
    @required this.filterType,
    @required this.reset,
  });

  @override
  List<Object> get props => [movieList, filterType, reset];
}

class MoviesErrorState extends MoviesState {
  final dynamic error;

  MoviesErrorState({@required this.error});

  @override
  List<Object> get props => [error];
}
