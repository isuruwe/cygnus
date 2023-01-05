import 'package:flutter/material.dart';
import 'package:cygnus/util/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape:  RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(30.0),
          ),
        ),

        child: Text(text, style: Theme.of(context).textTheme.button),
        onPressed: (){onPressed();},
      ),
    );
  }
}
