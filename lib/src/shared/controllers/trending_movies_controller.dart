import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class TrendingMoviesController extends GetController {
  List<Movie> _items = [];

  @override
  void onInit() {
    api.getPopularMovies().then((result) {
      this.setItems =
          result.results.where((item) => item.backdropPath != null).toList();
    }).catchError((error) {
      print(error);
    });
    super.onInit();
  }

  set setItems(newItems) {
    _items = [...newItems];
    update(this);
  }

  List<Movie> get items => [..._items];

  int get itemsCount => _items.length;
}
