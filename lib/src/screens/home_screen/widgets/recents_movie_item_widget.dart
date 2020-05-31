import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentMovieItemWidget extends StatelessWidget {
  final Movie movie;
  final List<Genres> genresList;

  const RecentMovieItemWidget(
      {@required this.movie, @required this.genresList});

  @override
  Widget build(BuildContext context) {
    print('RecentMovieItemWidget');
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Get.toNamed(RoutesPath.MovieDetails, arguments: {
                'movie': movie,
                'genresList': genresList,
              });
            },
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AutoSizeText(
            movie.title,
            maxLines: 2,
            style: theme.textTheme.headline6.copyWith(
              color: theme.accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
