import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:flutter/material.dart';

class HeaderMovieDetails extends StatefulWidget {
  const HeaderMovieDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _HeaderMovieDetailsState createState() => _HeaderMovieDetailsState();
}

class _HeaderMovieDetailsState extends State<HeaderMovieDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Hero(
          tag: widget.movie.title,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height * 0.4,
              minWidth: size.width,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
