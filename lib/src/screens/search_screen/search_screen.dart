import 'package:cinema_app/src/screens/search_screen/widgets/movie_item_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/controllers/trending_movies_controller.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrendingMoviesController>(
        builder: (_) => ListView.builder(
          itemBuilder: (context, index) {
            return MovieItemSearchScreen(
              movie: _.items[index],
            );
          },
          itemCount: _.items.length,
        ),
      ),
    );
  }
}
