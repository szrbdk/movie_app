import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/model/movie/movie.dart';

abstract class MovieInformationState extends Equatable {}

class MovieInfoInitialState extends MovieInformationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieInformationPageLodingState extends MovieInformationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieInformationPageLoadedState extends MovieInformationState {
  final Movie movie;

  MovieInformationPageLoadedState({@required this.movie});

  @override
  List<Object> get props => [movie];
}

class MovieInformationPageLoadErrorState extends MovieInformationState {
  final dynamic error;

  MovieInformationPageLoadErrorState({@required this.error});

  @override
  List<Object> get props => [error];
}
