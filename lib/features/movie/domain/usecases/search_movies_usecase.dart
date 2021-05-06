import 'package:dartz/dartz.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';
import 'package:omdbmovies/infrastructure/domain/usecase/usecase.dart';

class SearchMoviesUsecase extends Usecase<List<ShortMovieEntity>, String> {
  final MovieRepositoryContract repository;
  SearchMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ShortMovieEntity>>> call(String param) async {
    final result = await repository.searchMovies(search: param);
    return result;
  }
}
