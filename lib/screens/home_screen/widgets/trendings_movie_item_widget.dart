import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/utils.dart';
import 'package:cinema_app/widgets/genre_list_chips_widget.dart';
import 'package:cinema_app/widgets/movie_title_and_release_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingsMovieItemWidget extends StatelessWidget {
  const TrendingsMovieItemWidget({
    Key key,
    @required this.movieItem,
    @required this.genresList,
  }) : super(key: key);

  final Movie movieItem;
  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.05;
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesPath.MovieDetails, arguments: {
          'movie': movieItem,
          'genresList': genresList,
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Hero(
              tag: movieItem.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movieItem.backdropPath}',
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    colors: [
                      Colors.black54,
                      Colors.transparent.withOpacity(0.0),
                    ],
                    stops: [0.1, 1.0],
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: MovieTitleAndReleaseDateWidget(
                          movieItem: movieItem,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GenreListChipsWidget(
                        movieItem: movieItem,
                        genresList: genresList,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
