import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class GenresMoviesController extends GetxController {
  final RxList items = List<Genres>().obs;

  @override
  void onInit() async {
    try {
      final result = await api.getGenresList();
      items.assignAll(result.genres);
    } on Exception {}
    super.onInit();
  }
}
