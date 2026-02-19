import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
abstract class MoviesModel with _$MoviesModel {
  const factory MoviesModel({
    @Default(0) int total,
    @Default(0) int page,
    @Default(0) int pages,
    @JsonKey(name: 'tv_shows') @Default([]) List<TvShows> tvShow,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
abstract class TvShows with _$TvShows {
  const factory TvShows({
    @Default('') String name,
    @Default('') String permalink,
    @JsonKey(name: 'end_date') @Default('') String endDate,
    @Default('') String network,
    @JsonKey(name: 'image_thumbnail_path')
    @Default('')
    String imageThumnnailPath,
    @Default('') String status,
  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
