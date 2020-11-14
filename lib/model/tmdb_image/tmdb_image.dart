import 'dart:convert';

TmdbImage tmdbImageFromJson(String str) => TmdbImage.fromJson(json.decode(str));

String tmdbImageToJson(TmdbImage data) => json.encode(data.toJson());

class TmdbImage {
  int id;
  List<ImageDetail> backdrops;
  List<ImageDetail> posters;

  TmdbImage({
    this.id,
    this.backdrops,
    this.posters,
  });

  TmdbImage copyWith({
    int id,
    List<ImageDetail> backdrops,
    List<ImageDetail> posters,
  }) =>
      TmdbImage(
        id: id ?? this.id,
        backdrops: backdrops ?? this.backdrops,
        posters: posters ?? this.posters,
      );

  factory TmdbImage.fromJson(Map<String, dynamic> json) => TmdbImage(
        id: json["id"] == null ? null : json["id"],
        backdrops: json["backdrops"] == null
            ? null
            : List<ImageDetail>.from(
                json["backdrops"].map((x) => ImageDetail.fromJson(x))),
        posters: json["posters"] == null
            ? null
            : List<ImageDetail>.from(
                json["posters"].map((x) => ImageDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "backdrops": backdrops == null
            ? null
            : List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "posters": posters == null
            ? null
            : List<dynamic>.from(posters.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TmdbImage &&
        o.id == id &&
        o.backdrops == backdrops &&
        o.posters == posters;
  }

  @override
  int get hashCode => id.hashCode ^ backdrops.hashCode ^ posters.hashCode;

  @override
  String toString() =>
      'TmdbImage(id: $id, backdrops: $backdrops, posters: $posters)';
}

class ImageDetail {
  double aspectRatio;
  String filePath;
  int height;
  String iso6391;
  double voteAverage;
  int voteCount;
  int width;

  ImageDetail({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  ImageDetail copyWith({
    double aspectRatio,
    String filePath,
    int height,
    String iso6391,
    double voteAverage,
    int voteCount,
    int width,
  }) =>
      ImageDetail(
        aspectRatio: aspectRatio ?? this.aspectRatio,
        filePath: filePath ?? this.filePath,
        height: height ?? this.height,
        iso6391: iso6391 ?? this.iso6391,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        width: width ?? this.width,
      );

  factory ImageDetail.fromJson(Map<String, dynamic> json) => ImageDetail(
        aspectRatio: json["aspect_ratio"] == null
            ? null
            : json["aspect_ratio"].toDouble(),
        filePath: json["file_path"] == null ? null : json["file_path"],
        height: json["height"] == null ? null : json["height"],
        iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio == null ? null : aspectRatio,
        "file_path": filePath == null ? null : filePath,
        "height": height == null ? null : height,
        "iso_639_1": iso6391 == null ? null : iso6391,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
        "width": width == null ? null : width,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageDetail &&
        o.aspectRatio == aspectRatio &&
        o.filePath == filePath &&
        o.height == height &&
        o.iso6391 == iso6391 &&
        o.voteAverage == voteAverage &&
        o.voteCount == voteCount &&
        o.width == width;
  }

  @override
  int get hashCode {
    return aspectRatio.hashCode ^
        filePath.hashCode ^
        height.hashCode ^
        iso6391.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        width.hashCode;
  }

  @override
  String toString() {
    return 'ImageDetail(aspectRatio: $aspectRatio, filePath: $filePath, height: $height, iso6391: $iso6391, voteAverage: $voteAverage, voteCount: $voteCount, width: $width)';
  }
}
