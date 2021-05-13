import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdbmovies/features/movie/data/datasources/movie_datasource.dart';
import 'package:omdbmovies/features/movie/data/models/datailed_movie_model.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/data/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

import '../../../../fixtures/fixture_reader.dart';

class MovieDataSourceMock extends Mock implements MovieDatasource {}

void main() {
  late MovieRepository sut;
  late MovieDatasource datasource;
  late DetailedMovieModel movie;
  setUp(() {
    datasource = MovieDataSourceMock();
    sut = MovieRepository(datasource: datasource);
    final movieDetailsJson = json.decode(fixture('movie_detail.json'));
    movie = DetailedMovieModel().fromJson(movieDetailsJson);
  });

  group('searchMovies', () {
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
  });

  group('getMovieDetail', () {
    test(
      'should return a list of ShortMovieEntity in Right',
      () async {
        // arrange
        final imdb = faker.guid.guid();
        when(() => datasource.getMovieDetail(any())).thenAnswer((_) async => movie);
        // act
        final result = await sut.getMovieDetail(imdbID: imdb);
        // assert
        verify(() => datasource.getMovieDetail(any()));
        expect(result, isA<DetailedMovieEntity>());
      },
    );
  });
}
