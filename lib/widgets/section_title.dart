import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Trendings',
      style: theme.textTheme.title.copyWith(
        color: color,
      ),
    );
  }
}
