import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/usecases/search_movies_usecase.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieRepositoryMock extends Mock implements MovieRepositoryContract {}

class FailureMock extends Mock implements Failure {}

void main() {
  late MovieRepositoryMock repository;
  late SearchMoviesUsecase sut;
  late FailureMock failure;
  final search = faker.lorem.word();

  setUp(() {
    repository = MovieRepositoryMock();
    sut = SearchMoviesUsecase(repository);
    failure = FailureMock();
  });

  test(
    'should return a list of ShortMovieEntity in Right',
    () async {
      // arrange
      when(() => repository.searchMovies(search: search)).thenAnswer((_) async => Right(<ShortMovieEntity>[]));
      // act
      final result = await sut(search);
      // assert
      expect(result, isA<Right<Failure, List<ShortMovieEntity>>>());
    },
  );

  test(
    'should return a Failure if repository returns so',
    () async {
      // arrange
      when(() => repository.searchMovies(search: search)).thenAnswer((_) async => Left(failure));
      // act
      final result = await sut(search);
      final resultExtract = result.fold((failure) => failure, (success) => success);
      // assert
      expect(result, isA<Left>());
      expect(resultExtract, isA<Failure>());
    },
  );
}
