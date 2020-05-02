import 'package:cinema_app/models/Movie.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:flutter/material.dart';

import 'movie_item_with_title.dart';

class MovieListHorizontal extends StatelessWidget {
  const MovieListHorizontal({
    Key key,
    @required this.moviesList,
    @required this.genresList,
  }) : super(key: key);

  final List<Movie> moviesList;
  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.width * 0.45,
      ),
      child: ListView.separated(
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: moviesList.length,
        itemBuilder: (context, i) {
          return MovieItemWithTitle(
            movieItem: moviesList[i],
            genresList: genresList,
          );
        },
      ),
    );
  }
}
