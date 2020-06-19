import 'package:cinema_app/src/shared/widgets/genre_list_chips_widget.dart';
import 'package:flutter/material.dart';

import '../../../../models/movie.dart';

class MovieItemSearchScreen extends StatelessWidget {
  final Movie movie;

  const MovieItemSearchScreen({Key key, @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          // Stack 1
          SizedBox(
            height: 255,
            width: double.infinity,
          ),
          // Stack 2
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: theme.primaryColor.withOpacity(0.15),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: const Offset(
                    0.0, // Move to right 10  horizontally
                    3.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            height: 225,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  width: 150,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              movie.title,
                              style: theme.textTheme.headline4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 20,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                const Expanded(
                                  child: Text('8.7/10 IMDb 3h 2min'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: GenreListChipsWidget(
                              movieItem: movie,
                              backgroundColorChip:
                                  theme.primaryColor.withOpacity(0.1),
                              fontColorChip:
                                  theme.primaryColor.withOpacity(0.45),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Stack 3
          Positioned(
            bottom: 30,
            child: ClipRRect(
              child: Image.network(
                'https://image.tmdb.org/t/p/w185/${movie.posterPath}',
                width: 150,
                height: 225,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }
}
