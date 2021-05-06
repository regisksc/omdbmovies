import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieNotFoundFailure extends Failure {
  final String searchedMovie;
  MovieNotFoundFailure(this.searchedMovie) : super(message: 'Não foram encontrados filmes para \'$searchedMovie\'');
}

class SearchTooVagueFailure extends Failure {
  SearchTooVagueFailure();
}
