import 'package:flutter/material.dart';

class DefaultPaddingWidget extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  DefaultPaddingWidget({
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
