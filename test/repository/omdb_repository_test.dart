import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:mockito/mockito.dart';
import 'package:omdbmovies/models/short_movie_model.dart';
import 'package:omdbmovies/repository/omdb_repository.dart';
import 'package:omdbmovies/res/constants/constants.dart';

import '../fixtures/fixture_reader.dart';

class ClientMock extends Mock implements GetConnect {}

void main() {
  GetConnect http;
  OMDBRepository sut;
  setUp(() {
    http = ClientMock();
    sut = OMDBRepository(http: http);
  });

  test(
    'should return a list of ShortMovieModel',
    () async {
      // arrange
      when(http.get(Constants.baseUrl, query: anyNamed('query'))).thenAnswer(
        (_) async => Response(statusCode: 200, body: fixture('list_of_movies.json')),
      );
      // act
      final response = await sut.getMoviesByTitle();
      // assert
      expect(response, isA<List<ShortMovieModel>>());
    },
  );
}
