import 'package:dartz/dartz.dart';

import '../../../../infrastructure/domain/error/failure.dart';
import '../../../../infrastructure/domain/usecase/usecase.dart';
import '../entities/detailed_movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailUsecase extends Usecase<DetailedMovieEntity, String> {
  final MovieRepositoryContract repository;
  GetMovieDetailUsecase(this.repository);

  @override
  Future<Either<Failure, DetailedMovieEntity>> call(String param) async {
    final result = await repository.getMovieDetail(imdbID: param);
    return result;
  }
}
