import 'package:cinema_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FilmmakingDetails extends StatelessWidget {
  final Movie movie;

  FilmmakingDetails({
    Key key,
    @required this.movie,
  }) : super(key: key) {
    initializeDateFormatting('en_US', null);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Release Date: ',
                        style: theme.bodyText2,
                      ),
                      TextSpan(
                        text: DateFormat.yMMMMd().format(
                          DateTime.parse(movie.releaseDate),
                        ),
                        style: theme.bodyText1,
                      ),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Director: ',
                        style: theme.bodyText2,
                      ),
                      TextSpan(
                        text: 'Dean Deblois',
                        style: theme.bodyText1,
                      ),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Writers: ',
                        style: theme.bodyText2,
                      ),
                      TextSpan(
                        text: 'Dean Deblois ',
                        style: theme.bodyText1,
                      ),
                      TextSpan(
                        text: '(based upon the "How to Train Your Dragon")',
                        style: theme.bodyText2,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: size.width * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
