import 'package:cinema_app/screens/home_page.dart';
import 'package:cinema_app/screens/movie_details.dart';
import 'package:cinema_app/utils.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema App',
      initialRoute: 'Home',
      theme: ThemeData(
        primaryColor: hexToColor('#4947a7'),
        accentColor: hexToColor('#483785'),
      ),
      routes: {
        'Home': (context) => HomePage(),
        'MovieDetails': (context) => MovieDetails()
      },
    );
  }
}
