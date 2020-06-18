import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/src/screens/home_screen/widgets/trendings_movie_item_widget.dart';
import 'package:flutter/material.dart';

class TrendingMoviesListHorizontalWidget extends StatelessWidget {
  const TrendingMoviesListHorizontalWidget({
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, i) {
                return const SizedBox(
                  width: 20,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: popularMoviesList.length,
              itemBuilder: (context, i) {
                return TrendingsMovieItemWidget(
                  movieItem: popularMoviesList[i],
                  genresList: genresList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
