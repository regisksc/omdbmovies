import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/domain/failures/movie_failures.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';
import 'package:omdbmovies/res/constants/constants.dart';

abstract class MovieDatasource {
  final Dio http;
  MovieDatasource(this.http);
  Future<Either<Failure, List<ShortMovieModel>>> fetchMovies({required String searchQuery, int? page});
}

class ConcreteMovieDataSource implements MovieDatasource {
  final Dio http;
  ConcreteMovieDataSource({required this.http});
  @override
  Future<Either<Failure, List<ShortMovieModel>>> fetchMovies({required String searchQuery, int? page = 1}) async {
    final movies = <ShortMovieModel>[];
    final query = {'s': searchQuery, 'page': page, 'type': 'movie'};
    try {
      final response = await http.get(Constants.baseUrl, queryParameters: query);
      late List moviesJson;
      if ((response.data as Map).containsKey('Search')) moviesJson = response.data['Search'];
      moviesJson.forEach((movie) => movies.add(ShortMovieModel().fromJson(movie)));
      return Right(movies);
    } on DioError catch (e) {
      final errorMessage = e.response?.data['Error'] as String;
      final searchedQuery = e.requestOptions.data['s'];
      if (errorMessage.contains('many')) return Left(SearchTooVagueFailure());
      if (errorMessage.contains('not found')) return Left(MovieNotFoundFailure(searchedQuery));
      return Left(ServerFailure());
    }
  }
}
