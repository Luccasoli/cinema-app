import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/cast_section.dart';
import 'package:cinema_app/widgets/default_padding.dart';
import 'package:cinema_app/widgets/filmmaking_details.dart';
import 'package:cinema_app/widgets/header_movie_details.dart';
import 'package:cinema_app/widgets/reviews.dart';
import 'package:cinema_app/widgets/status_bar.dart';
import 'package:cinema_app/widgets/storyline_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
          StatusBar(),
          HeaderMovieDetails(
            movie: movie,
            genresList: genresList,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: DefaultPadding(
                child: Column(
                  children: <Widget>[
                    Reviews(),
                    FilmmakingDetails(
                      director: director,
                      writers: writers,
                      movie: movie,
                    ),
                    StorylineSection(
                      movie: movie,
                    ),
                    CastSection(
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
