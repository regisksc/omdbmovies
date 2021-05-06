import 'package:omdbmovies/features/movie/data/datasources/movie_datasource.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:omdbmovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieRepository implements MovieRepositoryContract {
  final MovieDatasource datasource;
  MovieRepository({required this.datasource});
  @override
  Future<Either<Failure, DetailedMovieEntity>> getMovieDetail({required String imdbID}) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ShortMovieEntity>>> searchMovies({required String search, int? page}) async {
    final movies = <ShortMovieEntity>[];

    final fetch = await datasource.fetchMovies(searchQuery: search, page: page);
    return fetch.fold(
      (failure) => Left(failure),
      (success) {
        final movieModels = <ShortMovieModel>[];
        movieModels.forEach((movieModel) => movies.add(movieModel.toEntity));
        return Right(movies);
      },
    );
  }
}
