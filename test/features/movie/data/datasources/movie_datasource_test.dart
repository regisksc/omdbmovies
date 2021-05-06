import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdbmovies/features/movie/data/datasources/movie_datasource.dart';
import 'package:omdbmovies/features/movie/data/models/datailed_movie_model.dart';
import 'package:omdbmovies/features/movie/data/models/short_movie_model.dart';
import 'package:omdbmovies/features/movie/domain/entities/short_movie_entity.dart';
import 'package:omdbmovies/res/constants/constants.dart';

import '../../../../fixtures/fixture_reader.dart';

class HttpMock extends Mock implements Dio {}

void main() {
  late HttpMock http;
  late MovieDatasource sut;
  late String fakePath;
  setUp(() {
    http = HttpMock();
    sut = ConcreteMovieDataSource(http: http);
  });

  group('fetchMovies', () {
    test(
      'should return a List of ShortMovieModel',
      () async {
        // arrange
        fakePath = faker.internet.httpUrl();
        final suggestedResponse = Response(
          requestOptions: RequestOptions(path: fakePath),
          data: json.decode(fixture('list_of_movies.json')) as Map<String, dynamic>,
          statusCode: 200,
        );
        when(
          () => http.get(Constants.baseUrl, queryParameters: any(named: 'queryParameters')),
        ).thenAnswer((_) async => suggestedResponse);
        // act
        final result = await sut.fetchMovies(searchQuery: faker.lorem.word());
        final resultExtract = result.fold((l) => l, (r) => r);
        // assert
        expect(resultExtract, isA<List<ShortMovieModel>>());
      },
    );
  });

  group('getMovieDetail', () {
    test(
      'should return a DetailedMovieModel',
      () async {
        // arrange
        fakePath = faker.internet.httpUrl();
        final suggestedResponse = Response(
          requestOptions: RequestOptions(path: fakePath),
          data: json.decode(fixture('movie_detail.json')) as Map<String, dynamic>,
          statusCode: 200,
        );
        when(
          () => http.get(Constants.baseUrl, queryParameters: any(named: 'queryParameters')),
        ).thenAnswer((_) async => suggestedResponse);
        // act
        final result = await sut.getMovieDetail(faker.guid.guid());
        final resultExtract = result.fold((l) => l, (r) => r);
        // assert
        expect(resultExtract, isA<DetailedMovieModel>());
      },
    );
  });
}
