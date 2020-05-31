import 'package:flutter/material.dart';

import '../../../../models/movie.dart';

class MovieItemSearchScreen extends StatelessWidget {
  final Movie movie;

  const MovieItemSearchScreen({Key key, @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: const Offset(
                    0.0, // Move to right 10  horizontally
                    0.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(movie.title),
                      Text(movie.title),
                      Text(movie.title),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Image.network(
              'https://image.tmdb.org/t/p/w300/${movie.posterPath}',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
