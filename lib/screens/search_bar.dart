import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
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
        decoration: InputDecoration(
          hintText: 'Type something',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
