import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/screens/movie_details_screen/widgets/cast_section_widget.dart';
import 'package:cinema_app/screens/movie_details_screen/widgets/filmmaking_details_widget.dart';
import 'package:cinema_app/screens/movie_details_screen/widgets/reviews_widget.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/default_padding_widget.dart';
import 'package:cinema_app/widgets/status_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/header_movie_details_screen_widget.dart';
import 'widgets/storyline_section_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Future<CastList> castList;
  Future<Crew> director;
  Future<List<Crew>> writers;
  List<Genres> genresList;
  Movie movie;

  @override
  void initState() {
    super.initState();
    movie = (Get.arguments as Map)['movie'];
    genresList = (Get.arguments as Map)['genresList'];

    api.getCast(movie.id).then(
      (value) {
        setState(() {
          castList = Future.value(value);
          director = Future.value(
              value.crew.where((crew) => crew.job == 'Director').toList()[0]);
          writers = Future.value(value.crew
              .where((crew) => crew.department == 'Writing')
              .toList());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StatusBarWidget(),
          HeaderMovieDetailsScreenWidget(
            movie: movie,
            genresList: genresList,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: DefaultPaddingWidget(
                child: Column(
                  children: <Widget>[
                    ReviewsWidget(),
                    FilmmakingDetailsWidget(
                      director: director,
                      writers: writers,
                      movie: movie,
                    ),
                    StorylineSectionWidget(
                      movie: movie,
                    ),
                    CastSectionWidget(
                      movie: movie,
                      castList: castList,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
