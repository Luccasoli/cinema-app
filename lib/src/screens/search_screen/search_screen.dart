import 'package:cinema_app/src/screens/search_screen/controllers/scroll_animation_controller_search_screen.dart';
import 'package:cinema_app/src/screens/search_screen/controllers/search_input_controller.dart';
import 'package:cinema_app/src/screens/search_screen/controllers/search_movies_controller.dart';
import 'package:cinema_app/src/screens/search_screen/widgets/movie_item_search_screen.dart';
import 'package:cinema_app/src/shared/widgets/background_animated_container.dart';
import 'package:cinema_app/src/shared/widgets/header_with_search_input_widget.dart';
import 'package:cinema_app/src/shared/widgets/status_bar_widget.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final SearchMoviesController searchMoviesController = Get.put(
    SearchMoviesController(),
  );
  final ScrollAnimationControllerSearchScreen scrollAnimationController =
      Get.put(
    ScrollAnimationControllerSearchScreen(),
  );
  final SearchInputController searchInputController =
      Get.put(SearchInputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const StatusBarWidget(),
          Expanded(
            child: Stack(
              children: <Widget>[
                BackgroundAnimatedContainer(
                  scrollAnimationController: scrollAnimationController,
                ),
                Column(
                  children: <Widget>[
                    HeaderWithSearchInputWidget(
                      isInputEnabled: true,
                      initialValue: searchInputController.search,
                      onChanged: searchInputController.onChanged,
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          controller:
                              scrollAnimationController.scrollController,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Get.toNamed(
                                RoutesPath.movieDetails,
                                arguments: {
                                  'movie': searchMoviesController.items[index]
                                },
                              ),
                              child: MovieItemSearchScreen(
                                movie: searchMoviesController.items[index],
                              ),
                            );
                          },
                          itemCount: searchMoviesController.items.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
