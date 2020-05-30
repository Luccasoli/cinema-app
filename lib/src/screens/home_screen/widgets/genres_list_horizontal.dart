import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/utils/genre_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenresListHorizontalWidget extends StatelessWidget {
  const GenresListHorizontalWidget({
    Key key,
    @required this.genresList,
  }) : super(key: key);

  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) => SizedBox(
          width: 25,
        ),
        itemCount: genresList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            genreIcons[genresList[i].name] != null
                ? SvgPicture.asset(
                    genreIcons[genresList[i].name],
                    height: theme.iconTheme.size,
                    width: theme.iconTheme.size,
                  )
                : SizedBox(
                    height: 50,
                    width: 50,
                  ),
            Text(
              genresList[i].name,
            ),
          ],
        ),
      ),
    );
  }
}
