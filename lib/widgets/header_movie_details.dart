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
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: movie.title,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.4,
          minWidth: size.width,
        ),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
