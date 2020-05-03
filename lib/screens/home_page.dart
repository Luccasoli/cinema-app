import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/models/now_playing_movies_list.dart';
import 'package:cinema_app/models/popular_movies_list.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/genres_list_horizontal.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:cinema_app/widgets/movies_list_horizontal.dart';
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

  @override
  void initState() {
    super.initState();
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
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Header(),
                  SizedBox(
                    height: 25,
                  ),
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
                    height: 200,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                      ),
                      itemCount: nowPlayingMoviesList.length,
                      itemBuilder: (context, index) {
                        return Text('oi');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
