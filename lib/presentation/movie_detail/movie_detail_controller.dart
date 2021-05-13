import 'package:get/get.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:omdbmovies/infrastructure/domain/error/failure.dart';

class MovieDetailController extends GetxController {
  late String? imdbID;
  final screenText = ''.obs;
  final isLoading = false.obs;
  late DetailedMovieEntity movie;

  @override
  void onReady() async {
    super.onReady();
    await getMovieDetails();
  }

  Future getMovieDetails() async {
    imdbID = Get.parameters['imdbID']!;
    if (imdbID == null) {
      Get.snackbar('Erro', 'ID nulo');
    } else {
      try {
        final usecase = Get.put<GetMovieDetailUsecase>(Get.find());
        isLoading.value = true;
        movie = await usecase(imdbID!);
        isLoading.value = false;
      } on Failure catch (failure) {
        screenText.value = failure.message ?? '';
        isLoading.value = false;
      }
    }
  }
}
