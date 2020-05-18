import 'package:cinema_app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieTitleAndReleaseDate extends StatelessWidget {
  const MovieTitleAndReleaseDate({
    Key key,
    @required this.movieItem,
    @required this.fontSize,
  }) : super(key: key);

  final Movie movieItem;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${movieItem.title} ',
            style: theme.textTheme.bodyText1.copyWith(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: '(${movieItem.releaseDate.split('-')[0]})',
            style: theme.textTheme.headline6.copyWith(
              color: Colors.white60,
              fontSize: fontSize * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
