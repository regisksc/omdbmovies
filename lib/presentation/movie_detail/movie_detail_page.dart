import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MovieDetailPage')),
      body: Obx(() {
        if (controller.isLoading.value) return CupertinoActivityIndicator();
        if (controller.screenText.value != '') return Center(child: Text(controller.screenText.value));
        final movie = controller.movie;
        return Column(
          children: [
            Expanded(child: Image.network(movie.poster)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(movie.title),
                  Text(movie.released),
                  Text(movie.director),
                  Text(movie.genre),
                  Text(movie.plot),
                  GestureDetector(
                    onTap: () => launch(movie.website),
                    child: Text(
                      movie.website,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
