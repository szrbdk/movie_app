import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MovieListItemEvent extends Equatable {}

class GetMovieListItemImageEvent extends MovieListItemEvent {
  final int tmdbId;

  GetMovieListItemImageEvent({@required this.tmdbId});

  @override
  List<Object> get props => [tmdbId];
}
