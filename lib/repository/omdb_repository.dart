import 'package:get/get.dart';
import 'package:omdbmovies/models/detailed_movie_model.dart';
import 'package:omdbmovies/models/short_movie_model.dart';
import 'package:omdbmovies/res/constants/constants.dart';

class OMDBRepository {
  final GetConnect http;

  OMDBRepository({this.http});
  //
  Future<List<ShortMovieModel>> getMoviesByTitle({String search, int page}) async {
    var result = <ShortMovieModel>[];
    final query = {'apiKey': Constants.apiKey, 'type': 'movie', 's': search, 'page': page};
    final response = await http.get(Constants.baseUrl, query: query);
    final searchContent = (response.body as Map<String, dynamic>)['Search'];
    if (searchContent is Iterable) {
      result = result..addAll((searchContent as List).map((result) => ShortMovieModel.fromJson(result)).toList());
    } else {
      result = result..add(ShortMovieModel.fromJson(searchContent));
    }
    return result;
  }
}
