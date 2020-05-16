import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final Color color;
  const StatusBar({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: this.color ?? Theme.of(context).primaryColor,
    );
  }
}
