import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class CastSection extends StatefulWidget {
  const CastSection({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _CastSectionState createState() => _CastSectionState();
}

class _CastSectionState extends State<CastSection> {
  CastList castList;

  @override
  void initState() {
    super.initState();
    api.getCast(widget.movie.id).then(
          (value) => {
            setState(() {
              castList = value;
            })
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
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
                      'https://image.tmdb.org/t/p/w500/${castList.cast[i].profilePath}',
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
      ),
    );
  }
}
