import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/ui/movie_information/bloc/movie_information_bloc.dart';
import 'package:progress_follower/ui/movie_information/bloc/movie_information_event.dart';
import 'package:progress_follower/ui/movie_information/bloc/movie_information_state.dart';
import 'package:progress_follower/ui/movie_information/screen/movie_information_page.dart';

class MovieInformationScreen extends StatefulWidget {
  final Movie movie;

  MovieInformationScreen({@required this.movie});

  @override
  _MovieInformationScreenState createState() => _MovieInformationScreenState();
}

class _MovieInformationScreenState extends State<MovieInformationScreen> {
  MovieInformationBloc _bloc;
  bool loading = false;
  Movie movie;

  @override
  void initState() {
    _bloc = MovieInformationBloc();
    _bloc.add(LoadMovieInformationPageEvent(movie: widget.movie));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(title: Text("${movie?.title ?? widget.movie.title}")),
        body: BlocListener(
          cubit: _bloc,
          listener: (context, state) {
            if (state is MovieInformationPageLodingState) {
              setState(() {
                loading = true;
              });
            }
            if (state is MovieInformationPageLoadedState) {
              setState(() {
                movie = state.movie;
                loading = false;
              });
            }
            if (state is MovieInformationPageLoadErrorState) {
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
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            }
          },
          child: loading
              ? Center(child: CircularProgressIndicator())
              : MovieInformationPage(movie: movie),
        ),
      ),
    );
  }
}
