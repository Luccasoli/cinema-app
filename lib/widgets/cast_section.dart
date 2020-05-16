import 'package:cinema_app/widgets/section_title.dart';
import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final list = List.filled(100, '0');
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
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.pink,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text('Nome do ator'),
                        Text(
                          'Papel',
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}
