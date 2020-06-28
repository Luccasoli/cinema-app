import 'package:cinema_app/src/shared/widgets/default_padding_widget.dart';
import 'package:cinema_app/src/shared/widgets/search_bar_widget.dart';
import 'package:cinema_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWithSearchInputWidget extends StatelessWidget {
  final bool isInputEnabled;
  final String initialValue;
  final void Function(String) onChanged;

  const HeaderWithSearchInputWidget({
    Key key,
    this.isInputEnabled = false,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 74.5,
                      ),
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
                DefaultPaddingWidget(
                  child: Padding(
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
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RoutesPath.searchScreen);
                            },
                            child: SearchBarWidget(
                              enabled: isInputEnabled,
                              initialValue: initialValue,
                              onChanged: onChanged,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
