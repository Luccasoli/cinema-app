import 'dart:math';

import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/models/now_playing_movies_list.dart';
import 'package:cinema_app/models/popular_movies_list.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/default_padding.dart';
import 'package:cinema_app/widgets/genres_list_horizontal.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:cinema_app/widgets/movies_list_horizontal.dart';
import 'package:cinema_app/widgets/recents_movie_item.dart';
import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> popularMoviesList = [];
  List<Genres> genresList = [];
  List<Movie> nowPlayingMoviesList = [];

  double height = 230;
  ScrollController _controller1;
  ScrollController _controller2;
  LinkedScrollControllerGroup _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _controller1 = _controllers.addAndGet();
    _controller2 = _controllers.addAndGet();

    Future.wait([
      api.getPopularMovies(),
      api.getGenresList(),
      api.getNowPlayingList()
    ]).then((onValue) => {
          setState(() {
            final tempPopularMoviesList = onValue[0] as PopularMoviesList;
            final tempGenresList = onValue[1] as GenresList;
            final tempNowPlayingMoviesList = onValue[2] as NowPlayingMoviesList;

            genresList = tempGenresList.genres;
            popularMoviesList = tempPopularMoviesList.results
                .where((item) => item.backdropPath != null)
                .toList();
            nowPlayingMoviesList = tempNowPlayingMoviesList.results
                .where((item) => item.posterPath != null)
                .toList();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _controller2,
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 100.0,
                  maxHeight: 200.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 100),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: screenSize.height,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.transparent),
                  ],
                ),
              ),
            ],
          ),
          DefaultPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Header(),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SectionTitle(
                              title: 'Trendings',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MoviesListHorizontal(
                              popularMoviesList: popularMoviesList,
                              genresList: genresList,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SectionTitle(
                                  title: 'Category',
                                  color: theme.accentColor,
                                ),
                                OutlineButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See more',
                                    style: theme.textTheme.caption.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                )
                              ],
                            ),
                            GenresListHorizontal(genresList: genresList),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          minHeight: 50.0,
                          maxHeight: 50.0,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            color: theme.scaffoldBackgroundColor,
                            child: SectionTitle(
                              title: 'Recents',
                              color: theme.accentColor,
                            ),
                          ),
                        ),
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return RecentMovieItem(
                              movie: popularMoviesList[index],
                              genresList: genresList,
                            );
                          },
                          childCount: popularMoviesList.length,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: screenSize.width / 2,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 2,
                        ),
                      )
                    ],
                    controller: _controller1,
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
