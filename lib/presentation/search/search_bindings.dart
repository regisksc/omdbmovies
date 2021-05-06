import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:omdbmovies/features/movie/data/datasources/movie_datasource.dart';
import 'package:omdbmovies/features/movie/data/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:omdbmovies/features/movie/domain/usecases/search_movies_usecase.dart';
import './search_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
    Get.lazyPut<MovieDatasource>(() => ConcreteMovieDataSource(http: Get.put(dio.Dio())));
    Get.lazyPut<MovieRepositoryContract>(() => MovieRepository(datasource: Get.find()));
    Get.lazyPut(() => SearchMoviesUsecase(Get.find()));
  }
}
