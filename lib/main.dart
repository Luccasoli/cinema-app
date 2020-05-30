import 'package:cinema_app/src/screens/home_screen/home_screen.dart';
import 'package:cinema_app/src/screens/movie_details_screen/movie_details_screen.dart';
import 'package:cinema_app/src/screens/search_screen/search_screen.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static Map<String, GetRoute> namedRoutes = {
    RoutesPath.Home: GetRoute(page: HomeScreen()),
    RoutesPath.MovieDetails: GetRoute(page: MovieDetailsScreen()),
    RoutesPath.SearchScreen: GetRoute(page: SearchScreen()),
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
    final primaryColor = Color(0xFF4947a7);
    final accentColor = Color(0xFF483785);
    return GetMaterialApp(
      initialRoute: RoutesPath.Home,
      namedRoutes: Routes.namedRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        textTheme: ThemeData().textTheme.copyWith(
              headline6: ThemeData().textTheme.headline6.copyWith(
                    color: accentColor,
                  ),
              bodyText1: ThemeData().textTheme.bodyText1.copyWith(
                    color: accentColor,
                  ),
              bodyText2: ThemeData().textTheme.bodyText2.copyWith(
                    color: accentColor,
                  ),
            ),
      ),
    );
  }
}
