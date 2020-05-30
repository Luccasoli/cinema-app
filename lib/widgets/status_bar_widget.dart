import 'package:flutter/material.dart';

class StatusBarWidget extends StatelessWidget {
  final Color color;
  const StatusBarWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: this.color ?? Theme.of(context).primaryColor,
    );
  }
}
