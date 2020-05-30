import 'package:cinema_app/src/shared/widgets/search_bar_widget.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderHomeScreenWidget extends StatelessWidget {
  const HeaderHomeScreenWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 16.4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RoutesPath.SearchScreen);
                  },
                  child: SearchBarWidget(
                    enabled: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
