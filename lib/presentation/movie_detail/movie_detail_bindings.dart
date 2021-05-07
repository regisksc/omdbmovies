import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/movie/data/datasources/movie_datasource.dart';
import '../../features/movie/data/repositories/movie_repository.dart';
import '../../features/movie/domain/repositories/movie_repository.dart';
import '../../features/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'movie_detail_controller.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailController());
    Get.lazyPut<MovieDatasource>(() => ConcreteMovieDataSource(http: Get.put(Dio())));
    Get.lazyPut<MovieRepositoryContract>(() => MovieRepository(datasource: Get.find()));
    Get.lazyPut(() => GetMovieDetailUsecase(Get.find()));
  }
}
