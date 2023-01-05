import 'package:flutter/material.dart';
import 'package:cygnus/util/constants.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedOutlinedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(30.0),
            ),
          ),

          child: Text(text, style: Theme.of(context).textTheme.button),
          onPressed: (){onPressed();},
         
        ));
  }
}
