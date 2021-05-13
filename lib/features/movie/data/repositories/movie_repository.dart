import 'package:dartz/dartz.dart';

import '../../../../infrastructure/domain/error/failure.dart';
import '../../domain/entities/detailed_movie_entity.dart';
import '../../domain/entities/short_movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_datasource.dart';
import '../models/short_movie_model.dart';

class MovieRepository implements MovieRepositoryContract {
  final MovieDatasource datasource;
  MovieRepository({required this.datasource});
  @override
  Future<DetailedMovieEntity> getMovieDetail({required String imdbID}) async {
    final fetch = await datasource.getMovieDetail(imdbID);
    return fetch.toEntity;
  }

  @override
  Future<Either<Failure, List<ShortMovieEntity>>> searchMovies({required String search, int? page}) async {
    final fetch = await datasource.fetchMovies(searchQuery: search, page: page);
    return fetch.map(
      (success) => success.map((movieModel) => movieModel.toEntity).toList(),
    );
  }
}
