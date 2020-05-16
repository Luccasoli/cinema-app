import 'package:cinema_app/models/cast.dart';
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
  CastList castList;
  Crew director;
  List<Crew> writers;
  Movie movie;

  @override
  void initState() {
    super.initState();
    Movie movie = Get.arguments as Movie;
    api.getCast(movie.id).then(
          (value) => {
            setState(() {
              castList = value;
              director = value.crew
                  .where((crew) => crew.job == 'Director')
                  .toList()[0];
              writers = value.crew
                  .where((crew) => crew.department == 'Writing')
                  .toList();
            })
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StatusBar(),
          HeaderMovieDetails(movie: movie),
          Expanded(
            child: SingleChildScrollView(
              child: DefaultPadding(
                child: Column(
                  children: <Widget>[
                    Reviews(),
                    FilmmakingDetails(
                      movie: movie,
                    ),
                    StorylineSection(
                      movie: movie,
                    ),
                    CastSection(
                      movie: movie,
                      castList: castList,
                      director: director,
                      writers: writers,
                    )
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
