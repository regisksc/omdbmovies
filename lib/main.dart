import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omdbmovies/presentation/movie_detail/movie_detail_bindings.dart';
import 'package:omdbmovies/presentation/movie_detail/movie_detail_page.dart';

import 'presentation/home/home_bindings.dart';
import 'presentation/home/home_page.dart';
import 'presentation/movie_detail/middleware/movie_detail_middleware.dart';
import 'presentation/search/search_bindings.dart';
import 'presentation/search/search_page.dart';
import 'package:supercharged/supercharged.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter OMDB Getx Demo',
      initialBinding: HomeBindings(),
      initialRoute: 'home',
      getPages: [
        GetPage(name: 'home', page: () => HomePage()),
        GetPage(name: 'search', page: () => SearchPage(), binding: SearchBindings()),
        GetPage(
          name: 'movie/:imdbID',
          page: () => MovieDetailPage(),
          binding: MovieDetailBindings(),
          middlewares: [MovieDetailMiddleware()],
        ),
      ],
    );
  }
}
