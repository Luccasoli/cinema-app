import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class NowPlayingMoviesController extends GetController {
  List<Movie> items = [];

  @override
  void onInit() async {
    try {
      final result = await api.getNowPlayingList();
      items =
          result.results.where((item) => item.backdropPath != null).toList();
      update(this);
    } catch (e) {}
    super.onInit();
  }
}
