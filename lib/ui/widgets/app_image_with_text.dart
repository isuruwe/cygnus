import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('assets/images/tinder_icon.png'),
            width: 300.0,
            height: 300.0,
          ),
          SizedBox(width: 5.0),
          // Text(
          //   'Tune',
          //   style: Theme.of(context).textTheme.headline2,
          // )
        ],
      ),
    );
  }
}
