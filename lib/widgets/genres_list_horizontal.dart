import 'package:cinema_app/models/genres.dart';
import 'package:flutter/material.dart';

class GenresListHorizontal extends StatelessWidget {
  const GenresListHorizontal({
    Key key,
    @required this.genresList,
  }) : super(key: key);

  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) => SizedBox(
          width: 25,
        ),
        itemCount: genresList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Text(
          genresList[i].name,
        ),
      ),
    );
  }
}
