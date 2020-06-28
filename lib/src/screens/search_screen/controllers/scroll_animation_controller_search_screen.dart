import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScrollAnimationControllerSearchScreen extends GetxController {
  final RxDouble<double> value = 200.0.obs;
  final ScrollController scrollController = ScrollController();

  void onScroll() {
    if (scrollController.offset <= 200) {
      value.value = 200 - scrollController.offset;
    }
  }

  @override
  void onInit() {
    scrollController.addListener(onScroll);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(onScroll);
    super.onClose();
  }
}
