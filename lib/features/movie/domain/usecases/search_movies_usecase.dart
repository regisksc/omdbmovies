import 'package:dartz/dartz.dart';

import '../../../../infrastructure/domain/error/failure.dart';
import '../../../../infrastructure/domain/usecase/usecase.dart';
import '../entities/short_movie_entity.dart';
import '../repositories/movie_repository.dart';

class SearchMoviesUsecase extends Usecase<List<ShortMovieEntity>, String> {
  final MovieRepositoryContract repository;
  SearchMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ShortMovieEntity>>> call(String param) async {
    final result = await repository.searchMovies(search: param);
    return result;
  }
}
