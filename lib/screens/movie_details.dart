import 'package:cinema_app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context).settings.arguments;

    return Hero(
        tag: movie.title,
        child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'));
  }
}
