import 'package:equatable/equatable.dart';

class ShortMovieEntity extends Equatable {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  ShortMovieEntity({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });
  @override
  List<Object> get props => [
        this.title,
        this.year,
        this.imdbID,
        this.type,
        this.poster,
      ];
}
