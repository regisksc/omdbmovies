// import 'package:dio/dio.dart';

// import '../models/short_movie_model.dart';
// import '../res/constants/constants.dart';

// class OMDBRepository {
//   final Dio http;

//   OMDBRepository({this.http});
//   //
//   Future<List<ShortMovieModel>> getMoviesByTitle({String search, int page}) async {
//     try {
//       var result = <ShortMovieModel>[];
//       final query = {'type': 'movie', 's': search, 'page': page};
//       final response = await http.get(Constants.baseUrl, queryParameters: query);
//       final searchContent = (response.data as Map<String, dynamic>)['Search'];
//       if (searchContent is Iterable) {
//         result = result..addAll((searchContent as List).map((result) => ShortMovieModel.fromJson(result)).toList());
//       } else {
//         result = result..add(ShortMovieModel.fromJson(searchContent));
//       }
//       return result;
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
// }
