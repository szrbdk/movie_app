import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/ui/movie_information/screen/movie_information_screen.dart';
import 'package:progress_follower/utils/enums.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item_bloc/movie_list_item_bloc.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item_bloc/movie_list_item_event.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item_bloc/movie_list_item_state.dart';

class MovieListItem extends StatefulWidget {
  final Movie movie;

  MovieListItem({@required this.movie});

  @override
  _MovieListItemState createState() => _MovieListItemState(movie);
}

class _MovieListItemState extends State<MovieListItem> {
  Movie movie;
  _MovieListItemState(this.movie);

  MovieListItemBloc _bloc;

  @override
  void initState() {
    _bloc = MovieListItemBloc();
    _bloc.add(GetMovieListItemImageEvent(tmdbId: movie.ids.tmdb));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener(
        cubit: _bloc,
        listener: (context, state) {
          if (state is MovieListItemImageFoundState) {
            setState(() {
              movie.image = state.image;
            });
          }
          if (state is MovieListItemImageSearchErrorState) {
            print("Error: Image Search Failed -> ${state.tmdbId}");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: screenWidth * 0.5 - 4,
                height: screenWidth * 0.5 * 1.5,
                child: movie.poster == null
                    ? Container(color: Colors.grey)
                    : GestureDetector(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiHelper.tmdbImageUrl(movie.poster, size: ImageSize.w342)}",
                          fit: BoxFit.fill,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MovieInformationScreen(movie: movie);
                              },
                            ),
                          );
                        },
                      ),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   child: Container(
              //     color: Colors.red,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisSize: MainAxisSize.min,
              //       children: <Widget>[
              //         Text("${movie.year}"),
              //         Text("${movie.title}"),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
