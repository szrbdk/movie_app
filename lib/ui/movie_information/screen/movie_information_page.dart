import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/manager/temp_storage.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:intl/intl.dart';
import 'package:progress_follower/widget/sub_detail_rich_text/sub_detail_rich_text.dart';

class MovieInformationPage extends StatelessWidget {
  final Movie movie;

  MovieInformationPage({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return movie == null
        ? Container()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildPageImage(),
                buildMovieTitle(),
                buildMovieTagline(),
                buildMovieOverview(),
                buildReleasedText(),
                buildRuntimeText(),
                buildGenresText(),
                buildCountryText(),
                buildLanguageText(),
              ],
            ),
          );
  }

  Widget buildGenresText() {
    return SubDetailRichText(
      title: "Genres",
      content: "${movie.genres.join(", ")}",
    );
  }

  Widget buildCountryText() {
    String country = TempStorage()
            .countries
            .firstWhere(
              (element) => element.code == movie.country,
              orElse: () => null,
            )
            ?.name ??
        movie.country.toUpperCase();
    return SubDetailRichText(
      title: "Country",
      content: "$country",
      // content: "${movie.country.toUpperCase()}",
    );
  }

  Widget buildLanguageText() {
    String language = TempStorage()
            .languages
            .firstWhere(
              (element) => element.code == movie.language,
              orElse: () => null,
            )
            ?.name ??
        movie.language.toUpperCase();
    return SubDetailRichText(
      title: "Language",
      content: "$language",
    );
  }

  Widget buildRuntimeText() {
    return SubDetailRichText(
      title: "Runtime",
      content: "${movie.runtime} minutes",
    );
  }

  Widget buildReleasedText() {
    return SubDetailRichText(
      title: "Released",
      content: "${DateFormat.yMMMd().format(movie.released)}",
    );
  }

  Padding buildMovieOverview() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Text(
        "${movie.overview}",
        style: TextStyle(
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Padding buildMovieTagline() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Text(
        "${movie.tagline}",
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Padding buildMovieTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: "${movie.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CachedNetworkImage buildPageImage() {
    return CachedNetworkImage(
        imageUrl: "${ApiHelper.tmdbImageUrl(movie?.backdrop)}");
  }
}
