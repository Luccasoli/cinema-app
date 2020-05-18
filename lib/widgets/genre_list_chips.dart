import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:flutter/material.dart';

class GenreListChips extends StatelessWidget {
  const GenreListChips({
    Key key,
    @required this.movieItem,
    @required this.genresList,
  }) : super(key: key);

  final Movie movieItem;
  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
        separatorBuilder: (context, i) => SizedBox(
              width: 10,
            ),
        itemCount: movieItem.genreIds.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Theme(
              data: ThemeData(canvasColor: Colors.transparent),
              child: Chip(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                backgroundColor: Colors.white24,
                label: Text(
                  genresList
                      .firstWhere((item) => item.id == movieItem.genreIds[i])
                      .name,
                  style: theme.chipTheme.labelStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ));
  }
}
