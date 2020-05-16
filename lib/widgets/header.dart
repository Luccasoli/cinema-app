import 'package:cinema_app/screens/search_bar.dart';
import 'package:cinema_app/widgets/status_bar.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StatusBar(),
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
                child: SearchBar(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
