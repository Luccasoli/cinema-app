import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/src/screens/search_screen/controllers/search_movies_controller.dart';
import 'package:get/get.dart';

class SearchInputController extends GetxController {
  final RxString<String> _search = ''.obs;

  String get search => _search.value;

  @override
  void onInit() {
    super.onInit();
    debounce(
      _search,
      (_) async {
        try {
          final result = await api.searchMovies(search);
          Get.find<SearchMoviesController>().items = result.results
              .where((item) => item.backdropPath != null)
              .toList();
        } catch (e) {
          print(e);
        }
      },
      time: const Duration(
        seconds: 1,
      ),
    );
  }

  // ignore: use_setters_to_change_properties
  void onChanged(String newValue) {
    _search.value = newValue;
  }
}
