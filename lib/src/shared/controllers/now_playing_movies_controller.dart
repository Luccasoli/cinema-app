import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/services/api.dart';
import 'package:get/get.dart';

class NowPlayingMoviesController extends GetController {
  List<Movie> _items = [];

  @override
  void onInit() {
    api.getNowPlayingList().then((result) {
      this.setItems =
          result.results.where((item) => item.posterPath != null).toList();
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
