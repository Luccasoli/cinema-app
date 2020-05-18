import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    this.onSeeMoreClick,
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;
  final String title;
  final Function onSeeMoreClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.headline6.copyWith(
            color: color,
          ),
        ),
        onSeeMoreClick != null
            ? OutlineButton(
                onPressed: () {},
                child: Text(
                  'See more',
                  style: theme.textTheme.caption.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )
            : Container(),
      ],
    );
  }
}
