// To parse this JSON data, do
//
//     final moviemodaltrending = moviemodaltrendingFromJson(jsonString);

import 'dart:convert';

Moviemodaltrending moviemodaltrendingFromJson(String str) => Moviemodaltrending.fromJson(json.decode(str));

String moviemodaltrendingToJson(Moviemodaltrending data) => json.encode(data.toJson());

class Moviemodaltrending {
  Moviemodaltrending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int?totalResults;

  factory Moviemodaltrending.fromJson(Map<String, dynamic> json) => Moviemodaltrending(
    page: json["page"] == null ? null : json["page"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    totalResults: json["total_results"] == null ? null : json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages == null ? null : totalPages,
    "total_results": totalResults == null ? null : totalResults,
  };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.id,
    this.releaseDate,
    this.title,
    this.popularity,
    this.mediaType,
    this.originCountry,
    this.name,
    this.firstAirDate,
    this.originalName,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String ?posterPath;
  bool ?video;
  double? voteAverage;
  int ?voteCount;
  String? overview;
  int ?id;
  DateTime? releaseDate;
  String? title;
  double? popularity;
  MediaType? mediaType;
  List<String>? originCountry;
  String? name;
  DateTime? firstAirDate;
  String? originalName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    overview: json["overview"] == null ? null : json["overview"],
    id: json["id"] == null ? null : json["id"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null : json["title"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    name: json["name"] == null ? null : json["name"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    originalName: json["original_name"] == null ? null : json["original_name"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
    "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle == null ? null : originalTitle,
    "poster_path": posterPath == null ? null : posterPath,
    "video": video == null ? null : video,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
    "overview": overview == null ? null : overview,
    "id": id == null ? null : id,
    "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title == null ? null : title,
    "popularity": popularity == null ? null : popularity,
    "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
    "name": name == null ? null : name,
    "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "original_name": originalName == null ? null : originalName,
  };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

enum OriginalLanguage { EN, ES }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
