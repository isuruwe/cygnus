import 'package:flutter/material.dart';

class RoundIconButton2 extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;
  final String imageAsset;

  RoundIconButton2.large(
      {required this.icon,
        required this.iconColor,
        this.size = 60.0,
        required this.onPressed,
        required this.imageAsset});

  RoundIconButton2.small(
      {required this.icon,
        required this.iconColor,
        this.size = 50.0,
        required this.onPressed,
        required this.imageAsset});

  RoundIconButton2.widget(
      {required this.icon,
        required this.iconColor,
        this.size = 50.0,
        required this.onPressed,
        required this.imageAsset});

  RoundIconButton2(
      {required this.icon, required this.iconColor, required this.size, required this.onPressed, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10.0,
                spreadRadius: 1)
          ]),
      child: imageAsset == null
          ? new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      )
          : new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: Image.asset(
          imageAsset,
          height: size ,
          width: size ,
          //color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
