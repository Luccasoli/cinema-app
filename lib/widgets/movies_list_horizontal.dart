import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/widgets/trendings_movie_item.dart';
import 'package:flutter/material.dart';

class MoviesListHorizontal extends StatelessWidget {
  const MoviesListHorizontal({
    Key key,
    @required this.popularMoviesList,
    @required this.genresList,
  }) : super(key: key);

  final List<Movie> popularMoviesList;
  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.width * 0.45,
      ),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: popularMoviesList.length,
        itemBuilder: (context, i) {
          return TrendingsMovieItem(
            movieItem: popularMoviesList[i],
            genresList: genresList,
          );
        },
      ),
    );
  }
}
