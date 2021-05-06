import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../features/movie/domain/entities/short_movie_entity.dart';
import '../../features/movie/domain/usecases/search_movies_usecase.dart';
import '../../infrastructure/domain/error/failure.dart';

class SearchController extends GetxController {
  final listOfMovies = <ShortMovieEntity>[].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  static const initialScreenText = 'Digite sua busca acima';
  final screenText = initialScreenText.obs;
  final fieldController = Get.put(TextEditingController());

  void restartState() {
    fieldController.clear();
    searchQuery.value = '';
    screenText.value = initialScreenText;
  }

  @override
  Future? onInit() {
    super.onInit();
    debounce(
      searchQuery,
      (_) => populateListWithQuery(),
      time: Duration(milliseconds: 1500),
    );
  }

  Future populateListWithQuery() async {
    listOfMovies.clear();
    if (searchQuery.value != '') {
      final usecase = Get.find<SearchMoviesUsecase>();
      isLoading.value = true;
      final fetchedList = await usecase(searchQuery.value);
      fetchedList.fold(
        (failure) =>
            failure is ServerFailure ? Get.snackbar('Erro', 'Erro de servidor') : screenText.value = failure.message!,
        (resultListOfMovies) => listOfMovies.addAll(resultListOfMovies),
      );
      isLoading.value = false;
    }
  }
}
