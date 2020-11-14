import 'package:flutter/material.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/widget/movie_list_item/movie_list_item.dart';

class MoviesPage extends StatelessWidget {
  final List<Movie> movieList;
  final bool loading;
  final Function nextPageFunction;
  MoviesPage({
    @required this.movieList,
    @required this.loading,
    @required this.nextPageFunction,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: movieList.map((e) {
              return MovieListItem(movie: e);
            }).toList(),
          ),
          ListTile(
            title: Text("Show More"),
            onTap: nextPageFunction,
          ),
        ],
      ),
    );
  }
}
