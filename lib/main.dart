import 'package:cinema_app/screens/home_page.dart';
import 'package:cinema_app/screens/movie_details.dart';
import 'package:cinema_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static Map<String, GetRoute> namedRoutes = {
    RoutesPath.Home: GetRoute(page: HomePage()),
    RoutesPath.MovieDetails: GetRoute(page: MovieDetails()),
  };
}

void main(List<String> args) {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = hexToColor('#4947a7');
    final accentColor = hexToColor('#483785');
    return GetMaterialApp(
      initialRoute: RoutesPath.Home,
      namedRoutes: Routes.namedRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        textTheme: ThemeData().textTheme.copyWith(
              headline6:
                  ThemeData().textTheme.headline6.copyWith(color: accentColor),
              bodyText1:
                  ThemeData().textTheme.bodyText1.copyWith(color: accentColor),
              bodyText2:
                  ThemeData().textTheme.bodyText2.copyWith(color: accentColor),
            ),
      ),
    );
  }
}
