import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ReviewItem(
            title: '7.1/10',
            subtitle: 'IMDb',
          ),
          ReviewItem(
            title: '91%',
            subtitle: 'Rotten Tomatoes',
          ),
          ReviewItem(
            title: '71%',
            subtitle: 'Metacritic',
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.headline6,
        ),
        Text(
          subtitle,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
