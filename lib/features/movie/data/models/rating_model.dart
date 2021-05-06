import 'package:omdbmovies/features/movie/domain/entities/rating_entity.dart';
import 'package:omdbmovies/infrastructure/data/model/model.dart';

class RatingModel implements Model {
  final String? source;
  final String? value;

  RatingModel({this.source, this.value});

  @override
  RatingModel fromJson(Map<String, dynamic> json) => RatingModel(
        source: json['Source'],
        value: json['Value'],
      );

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Source'] = this.source;
    data['Value'] = this.value;
    return data;
  }

  RatingEntity get toEntity => RatingEntity(
        source: source ?? '',
        value: value ?? '',
      );
}
