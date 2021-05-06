import 'dart:convert';

import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/infrastructure/data/model/model.dart';

class DetailedMovieModel extends Model {
  final String? title;
  final String? year;
  final String? released;
  final String? genre;
  final String? director;
  final String? plot;
  final String? country;
  final String? poster;
  // final List<RatingModel>? ratings;
  final String? website;

  DetailedMovieModel({
    this.title,
    this.year,
    this.released,
    this.genre,
    this.director,
    this.plot,
    this.country,
    this.poster,
    this.website,
  });

  @override
  DetailedMovieModel fromJson(Map<String, dynamic> json) => DetailedMovieModel(
        title: json['Title'],
        year: json['Year'],
        released: json['Released'],
        genre: json['Genre'],
        director: json['Director'],
        plot: json['Plot'],
        country: json['Country'],
        poster: json['Poster'],
        // ratings: json['Ratings'] != null
        //     ? <RatingModel>[...(json['Ratings'] as List).map((v) => RatingModel.fromJson(v)).toList()]
        //     : <RatingModel>[],
        website: json['Website'],
      );

  Map<String, dynamic> get toJson => {
        'Title': title,
        'Year': year,
        'Released': released,
        'Genre': genre,
        'Director': director,
        'Plot': plot,
        'Country': country,
        'Poster': poster,
        'Website': website,
      };

  @override
  String toString() {
    return 'DetailedMovieModel(title: $title, year: $year, released: $released, genre: $genre, director: $director, plot: $plot, country: $country, poster: $poster, website: $website)';
  }

  DetailedMovieEntity get toEntity => DetailedMovieEntity(
        title: title ?? '',
        year: year ?? '',
        released: released ?? '',
        genre: genre ?? '',
        director: director ?? '',
        plot: plot ?? '',
        country: country ?? '',
        poster: poster ?? '',
        website: website ?? '',
      );
}
