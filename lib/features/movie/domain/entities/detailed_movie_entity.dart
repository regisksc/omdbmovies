import 'package:equatable/equatable.dart';

class DetailedMovieEntity extends Equatable {
  final String title;
  final String year;
  final String released;
  final String genre;
  final String director;
  final String plot;
  final String country;
  final String poster;
  // final List<RatingModel> ratings;
  final String website;

  DetailedMovieEntity({
    required this.title,
    required this.year,
    required this.released,
    required this.genre,
    required this.director,
    required this.plot,
    required this.country,
    required this.poster,
    // required this.ratings,
    required this.website,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        this.title,
        this.year,
        this.released,
        this.genre,
        this.director,
        this.plot,
        this.country,
        this.poster,
        // this.ratings,
        this.website,
      ];
}
