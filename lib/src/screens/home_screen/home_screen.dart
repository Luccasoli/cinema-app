import 'package:cinema_app/src/screens/home_screen/controllers/scroll_animation_controller.dart';
import 'package:cinema_app/src/shared/controllers/genres_movies_controller.dart';
import 'package:cinema_app/src/shared/controllers/now_playing_movies_controller.dart';
import 'package:cinema_app/src/shared/controllers/trending_movies_controller.dart';
import 'package:cinema_app/src/shared/widgets/background_animated_container.dart';
import 'package:cinema_app/src/shared/widgets/default_padding_widget.dart';
import 'package:cinema_app/src/shared/widgets/header_with_search_input_widget.dart';
import 'package:cinema_app/src/shared/widgets/section_title_widget.dart';
import 'package:cinema_app/src/shared/widgets/status_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/genres_list_horizontal.dart';
import 'widgets/recents_movie_item_widget.dart';
import 'widgets/sliver_app_delegate.dart';
import 'widgets/trending_movies_horizontal_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final double height = 230;
  final GenresMoviesController genresController = Get.find();
  final TrendingMoviesController trendingMoviesController = Get.find();
  final NowPlayingMoviesController nowPlayingMoviesController = Get.find();
  final ScrollAnimationController scrollAnimationController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverAppBarDelegate(
                              minHeight: 74.5,
                              maxHeight: 7.0,
                              child: const HeaderWithSearchInputWidget(),
                            ),
                          ),
                          Obx(
                            () => SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  DefaultPaddingWidget(
                                    child: const SectionTitleWidget(
                                      title: 'Trendings',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Obx(
                                    () => TrendingMoviesListHorizontalWidget(
                                      popularMoviesList:
                                          trendingMoviesController.items.value,
                                      genresList: genresController.items.value,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  DefaultPaddingWidget(
                                    child: SectionTitleWidget(
                                      title: 'Category',
                                      color: theme.accentColor,
                                      onSeeMoreClick: () {},
                                    ),
                                  ),
                                  Obx(
                                    () => GenresListHorizontalWidget(
                                      genresList: genresController.items.value,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverAppBarDelegate(
                              minHeight: 50.0,
                              maxHeight: 50.0,
                              child: DefaultPaddingWidget(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  color: theme.scaffoldBackgroundColor,
                                  child: SectionTitleWidget(
                                    title: 'Recents',
                                    color: theme.accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DefaultPaddingWidget(
                            isSliver: true,
                            child: Obx(
                              () => Obx(
                                () => SliverGrid(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return RecentMovieItemWidget(
                                        movie: nowPlayingMoviesController
                                            .items[index],
                                        genresList:
                                            genresController.items.value,
                                      );
                                    },
                                    childCount:
                                        nowPlayingMoviesController.items.length,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: screenSize.width / 2,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1 / 2,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                        controller: scrollAnimationController.scrollController,
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
