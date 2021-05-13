import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omdbmovies/infrastructure/adapters/adapters.dart';
import './search_controller.dart';

class SearchPage extends StatelessWidget {
  final controller = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SearchPage')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 15,
            child: Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller.fieldController,
                onChanged: (value) => controller.searchQuery.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => controller.restartState(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 85,
            child: StateWatchAdapter(
              () {
                if (controller.isLoading.value == true) return CupertinoActivityIndicator();
                if (controller.listOfMovies.isEmpty) return Text(controller.screenText.value);
                return Scrollbar(
                  radius: Radius.zero,
                  showTrackOnHover: true,
                  child: ListView.separated(
                    itemCount: controller.listOfMovies.length,
                    separatorBuilder: (context, index) => SizedBox(height: 40),
                    itemBuilder: (context, index) {
                      final movie = controller.listOfMovies.elementAt(index);
                      return InkWell(
                        onTap: () => RoutingAdapter.navTo(route: 'movie/${movie.imdbID}'),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(flex: 4, child: Image.network(movie.poster)),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(movie.title),
                                    Text(movie.year),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
