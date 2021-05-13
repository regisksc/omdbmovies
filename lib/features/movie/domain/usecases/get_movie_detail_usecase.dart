import 'package:dartz/dartz.dart';

import '../../../../infrastructure/domain/error/failure.dart';
import '../../../../infrastructure/domain/usecase/usecase.dart';
import '../entities/detailed_movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailUsecase extends UsecaseWithoutEitherType<DetailedMovieEntity, String> {
  final MovieRepositoryContract repository;
  GetMovieDetailUsecase(this.repository);

  @override
  Future<DetailedMovieEntity> call(String param) async {
    try {
      final result = await repository.getMovieDetail(imdbID: param);
      return result;
    } catch (e) {
      // Converter pra exceção especifica
      rethrow;
    }
  }
}
