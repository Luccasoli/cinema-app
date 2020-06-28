import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundAnimatedContainer extends StatelessWidget {
  const BackgroundAnimatedContainer({
    Key key,
    @required this.scrollAnimationController,
  }) : super(key: key);

  final dynamic scrollAnimationController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        child: AnimatedContainer(
          duration: const Duration(seconds: 0),
          height: scrollAnimationController.value.value,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                ),
              ),
              Positioned(
                top: -70,
                right: -50,
                child: Container(
                  height: 230,
                  width: 230,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5f5eb7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
