import 'package:cinema_app/src/screens/home_screen/home_screen.dart';
import 'package:cinema_app/src/screens/home_screen/home_screen_binding.dart';
import 'package:cinema_app/src/screens/search_screen/search_screen.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/screens/movie_details_screen/movie_details_screen.dart';

class Routes {
  static final List<GetPage> namedRoutes = [
    GetPage(
        name: RoutesPath.home,
        page: () => HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(name: RoutesPath.movieDetails, page: () => MovieDetailsScreen()),
    GetPage(name: RoutesPath.searchScreen, page: () => SearchScreen()),
  ];
}

void main(List<String> args) {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF4947a7);
    final accentColor = const Color(0xFF483785);
    return GetMaterialApp(
      initialRoute: RoutesPath.home,
      getPages: Routes.namedRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        textTheme: ThemeData().textTheme.copyWith(
              headline4: ThemeData().textTheme.headline4.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
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
