import 'package:cinema_app/models/movie.dart';
import 'package:get/get.dart';

class SearchMoviesController extends GetxController {
  final RxList _items = List<Movie>().obs;

  List<Movie> get items => _items.value;
  set items(List<Movie> items) => _items.assignAll(items);
}
