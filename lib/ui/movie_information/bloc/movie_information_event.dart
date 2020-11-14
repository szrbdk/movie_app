import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/model/movie/movie.dart';

abstract class MovieInformationEvent extends Equatable {}

class LoadMovieInformationPageEvent extends MovieInformationEvent {
  final Movie movie;

  LoadMovieInformationPageEvent({@required this.movie});

  @override
  List<Object> get props => [movie];
}
