import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class GenresMoviesController extends GetController {
  List<Genres> items = [];

  @override
  void onInit() async {
    try {
      final result = await api.getGenresList();
      items = result.genres;
      update(this);
    } catch (e) {}
    super.onInit();
  }
}
