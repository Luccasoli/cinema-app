import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingsMovieItem extends StatelessWidget {
  const TrendingsMovieItem({
    Key key,
    @required this.movieItem,
    @required this.genresList,
  }) : super(key: key);

  final Movie movieItem;
  final List<Genres> genresList;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.05;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesPath.MovieDetails, arguments: movieItem);
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
                      Colors.grey.withOpacity(0.0),
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
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text(
                              movieItem.title,
                              style: theme.textTheme.title.copyWith(
                                color: Colors.white,
                                fontSize: fontSize,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(${movieItem.releaseDate.split('-')[0]})',
                              style: theme.textTheme.subtitle.copyWith(
                                color: Colors.white60,
                                fontSize: fontSize * 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, i) => SizedBox(
                                width: 10,
                              ),
                          itemCount: movieItem.genreIds.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Theme(
                                data:
                                    ThemeData(canvasColor: Colors.transparent),
                                child: Chip(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  backgroundColor: Colors.white24,
                                  label: Text(
                                    genresList
                                        .firstWhere((item) =>
                                            item.id == movieItem.genreIds[i])
                                        .name,
                                    style: theme.chipTheme.labelStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
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
