import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/src/shared/controllers/genres_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreListChipsWidget extends StatelessWidget {
  const GenreListChipsWidget({
    Key key,
    this.backgroundColorChip = Colors.white24,
    this.fontColorChip = Colors.white,
    @required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;
  final Color backgroundColorChip;
  final Color fontColorChip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => const SizedBox(
        width: 10,
      ),
      itemCount: movieItem.genreIds.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) => Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: Chip(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          backgroundColor: backgroundColorChip,
          label: GetBuilder<GenresMoviesController>(builder: (genres) {
            return Text(
              genres.items
                  .firstWhere((item) => item.id == movieItem.genreIds[i])
                  .name,
              style: theme.chipTheme.labelStyle.copyWith(
                color: fontColorChip,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ),
      ),
    );
  }
}
