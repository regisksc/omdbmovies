import 'package:get/get.dart';
import 'package:omdbmovies/models/detailed_movie_model.dart';
import 'package:omdbmovies/models/short_movie_model.dart';

class OMDBRepository {
  final GetConnect http;

  OMDBRepository({this.http});
  //
  Future<List<ShortMovieModel>> getMoviesByTitle() async {
    return <ShortMovieModel>[];
  }
}
