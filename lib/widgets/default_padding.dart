import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  DefaultPadding({
    @required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
