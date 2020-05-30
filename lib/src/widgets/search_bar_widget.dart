import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final bool enabled;

  SearchBarWidget({this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          hintText: 'Type something',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
