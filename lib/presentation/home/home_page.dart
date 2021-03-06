import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omdbmovies/infrastructure/adapters/adapters.dart';
import './home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: FloatingActionButton(
          onPressed: () => RoutingAdapter.navTo(route: 'search'),
          child: Text('proxima'),
        ),
      ),
    );
  }
}
