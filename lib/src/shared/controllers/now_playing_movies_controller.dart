import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class NowPlayingMoviesController extends GetxController {
  final RxList<Movie> items = List<Movie>().obs;

  @override
  void onInit() async {
    try {
      final result = await api.getNowPlayingList();
      items.assignAll(
        result.results.where((item) => item.backdropPath != null).toList(),
      );
    } on Exception {}
    super.onInit();
  }
}
