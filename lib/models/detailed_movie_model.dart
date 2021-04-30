import 'package:omdbmovies/models/rating_model.dart';

class DetailedMovieModel {
  String title;
  String year;
  String released;
  String genre;
  String director;
  String plot;
  String country;
  String poster;
  List<RatingModel> ratings;
  String website;

  DetailedMovieModel({
    this.title,
    this.year,
    this.released,
    this.genre,
    this.director,
    this.plot,
    this.country,
    this.poster,
    this.ratings,
    this.website,
  });

  DetailedMovieModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    released = json['Released'];
    genre = json['Genre'];
    director = json['Director'];
    plot = json['Plot'];
    country = json['Country'];
    poster = json['Poster'];
    if (json['Ratings'] != null) {
      ratings = <RatingModel>[];
      json['Ratings'].forEach((v) => ratings.add(new RatingModel.fromJson(v)));
    }
    website = json['Website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Released'] = this.released;
    data['Genre'] = this.genre;
    data['Director'] = this.director;
    data['Plot'] = this.plot;
    data['Country'] = this.country;
    data['Poster'] = this.poster;
    if (this.ratings != null) {
      data['Ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    data['Website'] = this.website;
    return data;
  }
}
