import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/src/shared/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';

class StorylineSectionWidget extends StatelessWidget {
  final Movie movie;

  StorylineSectionWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionTitleWidget(
            title: 'Storyline',
            color: theme.primaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(movie.overview),
        ],
      ),
    );
  }
}
