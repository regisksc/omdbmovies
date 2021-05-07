import 'package:get/get.dart';
import 'package:omdbmovies/features/movie/domain/entities/detailed_movie_entity.dart';
import 'package:omdbmovies/features/movie/domain/usecases/get_movie_detail_usecase.dart';

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
      final usecase = Get.put<GetMovieDetailUsecase>(Get.find());
      isLoading.value = true;
      final fetchedMovie = await usecase(imdbID!);
      fetchedMovie.fold(
        (failure) => screenText.value = failure.message ?? '',
        (resultMovie) => movie = resultMovie,
      );
      isLoading.value = false;
    }
  }
}
