import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/widgets/cast_section.dart';
import 'package:cinema_app/widgets/default_padding.dart';
import 'package:cinema_app/widgets/filmmaking_details.dart';
import 'package:cinema_app/widgets/header_movie_details.dart';
import 'package:cinema_app/widgets/reviews.dart';
import 'package:cinema_app/widgets/status_bar.dart';
import 'package:cinema_app/widgets/storyline_section.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context).settings.arguments;

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
                    CastSection()
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
