import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieDetailPage'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) return CupertinoActivityIndicator();
        if (controller.screenText.value != '') return Center(child: Text(controller.screenText.value));
        return Column(
          children: [
            Expanded(child: Image.network(controller.movie.poster)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.movie.title),
                  Text(controller.movie.released),
                  Text(controller.movie.director),
                  Text(controller.movie.genre),
                  Text(controller.movie.plot),
                  GestureDetector(
                    onTap: () => launch(controller.movie.website),
                    child: Text(controller.movie.website, style: TextStyle(color: Colors.lightBlueAccent)),
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
