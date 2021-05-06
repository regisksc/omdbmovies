import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'old/layout/home/home_bindings.dart';
import 'old/layout/home/home_page.dart';

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
        // GetPage(name: 'search', page: () => SearchPage(), binding: SearchBindings()),
      ],
    );
  }
}
