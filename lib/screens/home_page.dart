import 'package:cinema_app/models/Movie.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:cinema_app/widgets/movie_item_with_title.dart';
import 'package:cinema_app/widgets/movie_list_horizontal.dart';
import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> moviesList = [];
  List<Genres> genresList = [];

  @override
  void initState() {
    super.initState();
    api.getPopularMovies().then(
      (data) {
        setState(() {
          moviesList =
              data.results.where((item) => item.backdropPath != null).toList();
        });
      },
    );
    api.getGenresList().then((data) {
      setState(() {
        genresList = data.genres;
      });
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
                  SectionTitle(),
                  SizedBox(
                    height: 25,
                  ),
                  MovieListHorizontal(
                    moviesList: moviesList,
                    genresList: genresList,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
