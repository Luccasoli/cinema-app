import 'dart:math';

import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/models/now_playing_movies_list.dart';
import 'package:cinema_app/models/popular_movies_list.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/genres_list_horizontal.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:cinema_app/widgets/movies_list_horizontal.dart';
import 'package:cinema_app/widgets/recents_movie_item.dart';
import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> popularMoviesList = [];
  List<Genres> genresList = [];
  List<Movie> nowPlayingMoviesList = [];

  double height = 230;
  ScrollController _controller = ScrollController(initialScrollOffset: 200);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        height = max(0, 230 - _controller.offset);
      });
    });

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
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 100),
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Header(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    controller: _controller,
                    children: <Widget>[
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
                      SectionTitle(
                        title: 'Recents',
                        color: theme.accentColor,
                      ),
                      SizedBox(
                        height: screenSize.height - 140,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: screenSize.width / 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 2,
                          ),
                          itemCount: popularMoviesList.length,
                          itemBuilder: (context, index) {
                            return RecentMovieItem(popularMoviesList[index]);
                          },
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
