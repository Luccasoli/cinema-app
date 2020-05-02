import 'package:cinema_app/models/Movie.dart';
import 'package:flutter/material.dart';

class MovieItemWithTitle extends StatelessWidget {
  const MovieItemWithTitle({
    Key key,
    @required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.05;
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${movieItem.backdropPath}',
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
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        movieItem.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '(${movieItem.voteAverage})',
                    style: theme.textTheme.subtitle.copyWith(
                      color: Colors.white60,
                      fontSize: fontSize,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Chip(
                        label: Text(
                          movieItem.genreIds[0].toString(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
