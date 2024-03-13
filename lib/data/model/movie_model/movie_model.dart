// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    @JsonKey(name: "adult") bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_name") String? originalName,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "profile_path") String? personPath,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "media_type") String? mediaType,
    @JsonKey(name: "genre_ids") List<int>? genreIds,
    @JsonKey(name: "popularity") double? popularity,
    @JsonKey(name: "first_air_date") DateTime? firstAirDate,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
    @JsonKey(name: "origin_country") List<String>? originCountry,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    @JsonKey(name: "video") bool? video,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
