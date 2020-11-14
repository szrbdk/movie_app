import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_follower/utils/enums.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class GetMoviesEvent extends MoviesEvent {
  final FilterType filter;
  final int page;
  final bool reset;

  GetMoviesEvent({
    @required this.filter,
    @required this.page,
    @required this.reset,
  });

  @override
  List<Object> get props => [filter, page, reset];
}
