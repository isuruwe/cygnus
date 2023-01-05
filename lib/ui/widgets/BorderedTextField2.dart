import 'package:flutter/material.dart';
import 'package:cygnus/util/constants.dart';

class BorderedTextField2 extends StatelessWidget {
  final String labelText;
  final String? iniText;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final textController;

  BorderedTextField2(
      {required this.labelText,
        required this.onChanged,
        this.keyboardType = TextInputType.text,
        this.iniText ,
        this.obscureText = false,
        this.autoFocus = false,
        this.textCapitalization = TextCapitalization.none,
        this.textController});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;

    return TextFormField(
      controller: textController,
      onChanged: onChanged,
      obscureText: obscureText,
      initialValue:iniText ,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color:Colors.black),
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
