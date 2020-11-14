import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/show/watched_history/watched_history.dart';
import 'package:progress_follower/model/sync/last_watched/last_watched.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';

class LastWatchedShowModel {
  SyncLastWatched show;
  WatchedHistory watchedEpisodes;
  TmdbImage images;

  LastWatchedShowModel({
    this.show,
    this.watchedEpisodes,
    this.images,
  });

  Map<String, dynamic> toJson() => {
        'show': show.toJson(),
        'watchedEpisodes': watchedEpisodes.toJson(),
        'images': images.toJson(),
      };

  factory LastWatchedShowModel.fromJson(Map<String, dynamic> json) =>
      LastWatchedShowModel(
        show: SyncLastWatched.fromJson(json['show']),
        watchedEpisodes: WatchedHistory.fromJson(json['watchedEpisodes']),
        images: TmdbImage.fromJson(json['images']),
      );

  LastWatchedShowModel copyWith({
    SyncLastWatched show,
    WatchedHistory watchedEpisodes,
    TmdbImage images,
    String slug,
  }) {
    return LastWatchedShowModel(
      show: show ?? this.show,
      images: images ?? this.images,
      watchedEpisodes: watchedEpisodes ?? this.watchedEpisodes,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LastWatchedShowModel &&
        o.show == show &&
        o.images == images &&
        o.watchedEpisodes == watchedEpisodes;
  }

  @override
  int get hashCode =>
      show.hashCode ^ watchedEpisodes.hashCode ^ images.hashCode;

  @override
  String toString() =>
      'LastWatchedShowModel show: $show, images: $images, watchedEpisodes: $watchedEpisodes';

  int get tmdb => show.show.ids.tmdb;
  String get slug => show.show.ids.slug;
  String get title => show.show.title;
  Episode get nextEpisode => watchedEpisodes?.nextEpisode;
  String get poster => images?.posters?.first?.filePath;

  List<ImageDetail> get posters => images?.posters;
  List<ImageDetail> get backdrops => images?.backdrops;

  set posters(List<ImageDetail> posterList) {
    if (images == null) {
      images = TmdbImage(posters: posterList);
    } else {
      images.posters = posterList;
    }
  }

  set backdrops(List<ImageDetail> backdropList) {
    if (images == null) {
      images = TmdbImage(backdrops: backdropList);
    } else {
      images.backdrops = backdropList;
    }
  }
}
