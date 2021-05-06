// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:omdbmovies/models/short_movie_model.dart';
// import 'package:omdbmovies/repository/omdb_repository.dart';

// class SearchController extends GetxController {
//   final stockImage =
//       'https://m.media-amazon.com/images/M/MV5BOGU1ZDI2NzYtMzBjZS00YTAxLThmNmYtMGM1ODY3MDRlOWY0XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg';

//   final listOfMovies = <ShortMovieModel>[].obs;
//   final repository = Get.find<OMDBRepository>();
//   final isLoading = false.obs;
//   final searchQuery = ''.obs;
//   final fieldController = Get.put(TextEditingController());

//   @override
//   Future onInit() {
//     super.onInit();
//     debounce(
//       searchQuery,
//       (_) => populateListWithQuery(),
//       time: Duration(milliseconds: 1500),
//     );
//   }

//   Future populateListWithQuery() async {
//     listOfMovies.clear();
//     if (searchQuery.value != '') {
//       isLoading.value = true;
//       final fetchedList = await repository.getMoviesByTitle(search: searchQuery.value, page: 1);
//       isLoading.value = false;
//       listOfMovies.addAll(fetchedList);
//     }
//   }
// }
