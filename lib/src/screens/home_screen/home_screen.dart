import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/models/now_playing_movies_list.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/src/screens/home_screen/widgets/header_home_screen_widget.dart';
import 'package:cinema_app/src/shared/controllers/now_playing_movies_controller.dart';
import 'package:cinema_app/src/shared/controllers/trending_movies_controller.dart';
import 'package:cinema_app/src/shared/widgets/default_padding_widget.dart';
import 'package:cinema_app/src/shared/widgets/section_title_widget.dart';
import 'package:cinema_app/src/shared/widgets/status_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'widgets/genres_list_horizontal.dart';
import 'widgets/recents_movie_item_widget.dart';
import 'widgets/sliver_app_delegate.dart';
import 'widgets/trending_movies_horizontal_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Genres> genresList = [];
  List<Movie> nowPlaying = [];

  double height = 230;
  ScrollController _controller1;
  ScrollController _controller2;
  LinkedScrollControllerGroup _controllers;

  @override
  void initState() {
    super.initState();
    Get.lazyPut<TrendingMoviesController>(() => TrendingMoviesController());
    Get.lazyPut<NowPlayingMoviesController>(() => NowPlayingMoviesController());

    _controllers = LinkedScrollControllerGroup();
    _controller1 = _controllers.addAndGet();
    _controller2 = _controllers.addAndGet();

    Future.wait([
      api.getGenresList(),
      api.getNowPlayingList(),
    ]).then((onValue) => {
          setState(() {
            final tempGenresList = onValue[1] as NowPlayingMoviesList;

            nowPlaying = tempGenresList.results
                .where((item) => item.posterPath != null)
                .toList();

            // genresList = tempGenresList.genres;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          StatusBarWidget(),
          Expanded(
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  controller: _controller2,
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 74.5,
                        maxHeight: 200.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints(minHeight: 74.5),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                ),
                              ),
                              Positioned(
                                top: -70,
                                right: -50,
                                child: Container(
                                  height: 230,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5f5eb7),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverFillRemaining(),
                  ],
                ),
                DefaultPaddingWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      HeaderHomeScreenWidget(),
                      Expanded(
                        child: CustomScrollView(
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SectionTitleWidget(
                                    title: 'Trendings',
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GetBuilder<TrendingMoviesController>(
                                    builder: (_) =>
                                        TrendingMoviesListHorizontalWidget(
                                      popularMoviesList: _.items,
                                      genresList: genresList,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SectionTitleWidget(
                                    title: 'Category',
                                    color: theme.accentColor,
                                    onSeeMoreClick: () {},
                                  ),
                                  GenresListHorizontalWidget(
                                    genresList: genresList,
                                  ),
                                ],
                              ),
                            ),
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: SliverAppBarDelegate(
                                minHeight: 50.0,
                                maxHeight: 50.0,
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
                            GetBuilder<NowPlayingMoviesController>(
                              builder: (_) => SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return RecentMovieItemWidget(
                                      movie: _.items[index],
                                      genresList: genresList,
                                    );
                                  },
                                  childCount: _.items.length,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: screenSize.width / 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1 / 2,
                                ),
                              ),
                            ),
                          ],
                          controller: _controller1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
