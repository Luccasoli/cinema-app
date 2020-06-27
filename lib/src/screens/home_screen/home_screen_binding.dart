import 'package:cinema_app/src/screens/home_screen/controllers/scroll_animation_controller.dart';
import 'package:get/get.dart';

import '../../shared/controllers/genres_movies_controller.dart';
import '../../shared/controllers/now_playing_movies_controller.dart';
import '../../shared/controllers/trending_movies_controller.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingMoviesController>(() => TrendingMoviesController());
    Get.lazyPut<NowPlayingMoviesController>(() => NowPlayingMoviesController());
    Get.lazyPut<GenresMoviesController>(() => GenresMoviesController());
    Get.put<ScrollAnimationController>(ScrollAnimationController());
  }
}
