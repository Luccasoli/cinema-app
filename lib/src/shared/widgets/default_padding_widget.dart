import 'package:flutter/material.dart';

class DefaultPaddingWidget extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final bool isSliver;

  DefaultPaddingWidget({
    @required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSliver) return SliverPadding(sliver: child, padding: padding);
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
