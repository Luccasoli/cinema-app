import 'package:cinema_app/screens/search_bar.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
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
    );
  }
}
