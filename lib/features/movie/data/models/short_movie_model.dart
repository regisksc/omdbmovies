import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/infrastructure/data/model/model.dart';

class ShortMovieModel extends Model {
  final String? title;
  final String? year;
  final String? imdbID;
  final String? type;
  final String? poster;

  ShortMovieModel({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }

  @override
  ShortMovieModel fromJson(Map<String, dynamic> json) => ShortMovieModel(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster'],
      );

  @override
  String toString() {
    return 'ShortMovieModel(title: $title, year: $year, imdbID: $imdbID, type: $type, poster: $poster)';
  }

  ShortMovieEntity get toEntity => ShortMovieEntity(
        title: title ?? '',
        year: year ?? '',
        imdbID: imdbID ?? '',
        type: type ?? '',
        poster: poster ?? '',
      );
}
