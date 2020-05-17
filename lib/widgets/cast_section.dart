import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  const CastSection({
    Key key,
    @required this.movie,
    @required this.castList,
  }) : super(key: key);

  final Movie movie;

  final Future<CastList> castList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FutureBuilder<CastList>(
          future: castList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Carregando...');
            }
            final CastList castList = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SectionTitle(
                  title: 'Full Cast',
                  color: theme.primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 170,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) => ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 80,
                        minWidth: 80,
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://image.tmdb.org/t/p/w200/${castList.cast[i].profilePath}',
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: <Widget>[
                                AutoSizeText(
                                  castList.cast[i].name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                AutoSizeText(
                                  castList.cast[i].character,
                                  style: theme.textTheme.caption,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: castList.cast.length,
                  ),
                )
              ],
            );
          }),
    );
  }
}
