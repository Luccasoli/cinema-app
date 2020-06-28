import 'package:cinema_app/src/shared/controllers/genres_movies_controller.dart';
import 'package:get/get.dart';

class SearchInputController extends GetxController {
  final RxString<String> _search = ''.obs;

  String get search => _search.value;

  @override
  void onInit() {
    super.onInit();
    debounce(
      _search,
      (_) {
        print('Debounce: $search');
        print(Get.find<GenresMoviesController>().items.value);
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
