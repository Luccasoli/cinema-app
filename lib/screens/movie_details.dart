import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  dynamic posterPath = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      // posterPath = Navigator.of(context).set['image'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'image',
        child: Image.network(posterPath),
      ),
    );
  }
}
