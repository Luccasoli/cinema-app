import 'dart:ui';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class RoutesPath {
  static const Home = '/';
  static const MovieDetails = '/MovieDetails';
}
