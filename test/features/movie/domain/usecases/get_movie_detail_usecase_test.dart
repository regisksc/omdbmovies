import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:omdbmovies/features/movie/domain/usecases/search_movies_usecase.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieRepositoryMock extends Mock implements MovieRepositoryContract {}

class FailureMock extends Mock implements Failure {}

class MovieDetailMock extends Mock implements DetailedMovieEntity {}

void main() {
  late MovieRepositoryMock repository;
  late GetMovieDetailUsecase sut;
  late FailureMock failure;
  late MovieDetailMock entity;
  final imdb = faker.guid.guid();

  setUp(() {
    repository = MovieRepositoryMock();
    sut = GetMovieDetailUsecase(repository);
    failure = FailureMock();
    entity = MovieDetailMock();
  });

  test(
    'should return a list of ShortMovieEntity in Right',
    () async {
      // arrange
      when(() => repository.getMovieDetail(imdbID: imdb)).thenAnswer((_) async => entity);
      // act
      final result = await sut(imdb);
      // assert
      expect(result, isA<DetailedMovieEntity>());
    },
  );

  test(
    'should rethrow',
    () async {
      // arrange
      when(() => repository.getMovieDetail(imdbID: imdb)).thenThrow(failure);
      // act
      final result = sut(imdb);
      // assert
      expect(result, throwsA(failure));
    },
  );
}
