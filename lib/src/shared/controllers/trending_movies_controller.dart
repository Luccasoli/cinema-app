import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class TrendingMoviesController extends GetxController {
  List<Movie> items = [];

  @override
  void onInit() async {
    try {
      final result = await api.getPopularMovies();
      items =
          result.results.where((item) => item.backdropPath != null).toList();
      update();
    } on Exception {}
    super.onInit();
  }
}
