import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdbmovies/features/movie/data/datasources/movie_datasource.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/data/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieDataSourceMock extends Mock implements MovieDatasource {}

void main() {
  late MovieRepository sut;
  late MovieDatasource datasource;
  setUp(() {
    datasource = MovieDataSourceMock();
    sut = MovieRepository(datasource: datasource);
  });

  test(
    'should return a list of ShortMovieEntity in Right',
    () async {
      // arrange
      final search = faker.lorem.word();
      when(
        () => datasource.fetchMovies(searchQuery: any(named: 'searchQuery')),
      ).thenAnswer((_) async => Right(<ShortMovieModel>[]));
      // act
      final result = await sut.searchMovies(search: search);
      // assert
      expect(result, isA<Right<Failure, List<ShortMovieEntity>>>());
    },
  );
}
