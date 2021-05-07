import 'package:freezed_annotation/freezed_annotation.dart';

import 'rating_model.dart';

part 'detailed_movie_model_freezed.freezed.dart';
part 'detailed_movie_model_freezed.g.dart';

@freezed
class DetailedMovieModelFreezed with _$DetailedMovieModelFreezed {
  factory DetailedMovieModelFreezed(
    String? title,
    String? year,
    String? released,
    String? genre,
    String? director,
    String? plot,
    String? country,
    String? poster,
    // List<RatingModel>? ratings,
    String? website,
  ) = _DetailedMovieModelFreezed;
  factory DetailedMovieModelFreezed.fromJson(Map<String, dynamic> json) => _$DetailedMovieModelFreezedFromJson(json);
}
