import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:omdbmovies/features/movie/data/models/datailed_movie_model.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/failures/movie_failures.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';
import 'package:omdbmovies/res/constants/constants.dart';

abstract class MovieDatasource {
  final Dio http;
  MovieDatasource(this.http);
  Future<Either<Failure, List<ShortMovieModel>>> fetchMovies({required String searchQuery, int? page});
  Future<Either<Failure, DetailedMovieModel>> getMovieDetail(String imdb);
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
      if ((response.data as Map).containsKey('Search')) {
        moviesJson = response.data['Search'];
        moviesJson.forEach((movie) => movies.add(ShortMovieModel().fromJson(movie)));
        return Right(movies);
      } else {
        throw DioError(requestOptions: response.requestOptions, response: response);
      }
    } on DioError catch (e) {
      final errorMessage = e.response?.data['Error'] as String;
      final searchedQuery = e.requestOptions.queryParameters['s'];
      if (errorMessage.contains('many')) return Left(SearchTooVagueFailure());
      if (errorMessage.contains('not found')) return Left(MovieNotFoundFailure(searchedQuery));
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DetailedMovieModel>> getMovieDetail(String imdb) async {
    final query = {'i': imdb, 'type': 'movie'};
    try {
      final response = await http.get(Constants.baseUrl, queryParameters: query);
      late DetailedMovieModel movie;
      if ((response.data as Map).containsKey('Error')) {
        final error = DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
        throw error;
      }
      movie = DetailedMovieModel().fromJson(response.data);
      return Right(movie);
    } on DioError catch (e) {
      final errorMessage = e.response?.data['Error'] as String;
      final searchedQuery = 'o id ${e.requestOptions.queryParameters['i']}';
      if (errorMessage.isNotEmpty) return Left(MovieNotFoundFailure(searchedQuery));
      return Left(ServerFailure());
    }
  }
}
