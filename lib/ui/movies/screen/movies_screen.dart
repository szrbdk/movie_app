import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/ui/movies/bloc/movies_bloc.dart';
import 'package:progress_follower/ui/movies/bloc/movies_event.dart';
import 'package:progress_follower/ui/movies/bloc/movies_state.dart';
import 'package:progress_follower/ui/movies/screen/movies_page.dart';
import 'package:progress_follower/utils/enums.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  MoviesBloc _moviesBloc;
  int page;
  bool loading;
  List<Movie> movies = [];

  @override
  void initState() {
    page = 1;
    loading = false;
    _moviesBloc = MoviesBloc();
    _moviesBloc.add(GetMoviesEvent(
      filter: FilterType.trending,
      page: page,
      reset: false,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _moviesBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          centerTitle: true,
        ),
        body: BlocListener<MoviesBloc, MoviesState>(
          cubit: _moviesBloc,
          listener: (context, state) {
            if (state is SearchingMoviesState) {
              setState(() {
                loading = true;
              });
            }
            if (state is MoviesFoundState) {
              setState(() {
                loading = false;
                if (state.reset) {
                  page = 1;
                }
                state.movieList.forEach((element) {
                  int index = movies.indexWhere(
                      (movie) => element.ids.trakt == movie.ids.trakt);
                  if (index == -1) {
                    movies.add(element);
                  }
                });
              });
            }
            if (state is MoviesErrorState) {
              setState(() {
                loading = false;
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("${state.error}"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            }
          },
          child: loading && movies.isEmpty
              ? Center(child: CircularProgressIndicator())
              : MoviesPage(
                  movieList: movies,
                  loading: loading,
                  nextPageFunction: () {
                    setState(() {
                      page = page + 1;
                    });
                    _moviesBloc.add(GetMoviesEvent(
                      filter: FilterType.trending,
                      page: page,
                      reset: false,
                    ));
                  },
                ),
        ),
      ),
    );
  }
}
