import 'package:cinema_app/models/movie.dart';
import 'package:flutter/material.dart';

class HeaderMovieDetails extends StatelessWidget {
  const HeaderMovieDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.title,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
      ),
    );
  }
}
