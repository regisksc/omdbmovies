import 'package:get/get.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/usecases/get_movie_detail_usecase.dart';

class MovieDetailController extends GetxController {
  late String imdbID;
  final screenText = ''.obs;
  final isLoading = false.obs;
  late DetailedMovieEntity movie;

  @override
  void onInit() {
    getMovieDetails();
    super.onInit();
  }

  void getMovieDetails() async {
    if (Get.parameters['imdbID'] != null) imdbID = Get.parameters['imdbID']!;
    print('asd');
    if (imdbID == '') {
      Get.snackbar('Erro', 'ID nulo');
    } else {
      final usecase = Get.find<GetMovieDetailUsecase>();
      isLoading.value = true;
      final fetchedMovie = await usecase(imdbID);
      fetchedMovie.fold(
        (failure) => screenText.value = failure.message ?? '',
        (resultMovie) => movie = resultMovie,
      );
      isLoading.value = false;
    }
  }
}
