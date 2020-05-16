import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        SectionTitle(
          title: 'Full Cast',
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
