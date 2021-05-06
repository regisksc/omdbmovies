import 'package:dartz/dartz.dart';

import '../../../../infrastructure/domain/error/failure.dart';
import '../entities/detailed_movie_entity.dart';
import '../entities/short_movie_entity.dart';

abstract class MovieRepositoryContract {
  Future<Either<Failure, List<ShortMovieEntity>>> searchMovies({required String search});
  Future<Either<Failure, DetailedMovieEntity>> getMovieDetail({required String imdbID});
}
