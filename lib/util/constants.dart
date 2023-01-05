import 'package:flutter/material.dart';

const kDefaultPadding = EdgeInsets.symmetric(
  vertical: 26.0,
  horizontal: 26.0,
);

const kPrimaryColor = Color(0xFFE60DF6);
const kSecondaryColor = Colors.white;
const kAccentColor = Color(0xFFF4C470);
const kAccentColor2 = Color(0xFF000000);
const kColorPrimaryVariant = Color(0xFFFAF5F5);

const kBackgroundColor = Color(0xFF7AEF13);
const kBackgroundColorInt = 0xFFE60DF6;
const kFontFamily = 'Nunito';
var remid = '';
const imgpath = 'https://www.tunelk.com/uploads/all/';
String? ptpref="0";
String pstate2="";
const kTextTheme = TextTheme(
  headline1: TextStyle(),
  bodyText1: TextStyle(),
  bodyText2: TextStyle(),
);

const kButtonTheme = ButtonThemeData(
  splashColor: Colors.deepOrange,
  padding: EdgeInsets.symmetric(vertical: 14),
  buttonColor: Color(0xFFF4C470),
  textTheme: ButtonTextTheme.accent,
  highlightColor: Color.fromRGBO(162, 25, 212, 0.30196078431372547),
  focusColor: Color.fromRGBO(189, 30, 30, 0.30196078431372547),
);

const Map<int, Color> kThemeMaterialColor = {
  50: Color.fromRGBO(82, 104, 175, 0.10196078431372549),
  100: Color.fromRGBO(32, 16, 121, 0.2),
  200: Color.fromRGBO(0, 147, 255, 0.30196078431372547),
  300: Color.fromRGBO(199, 137, 137, 0.4),
  000: Color.fromRGBO(168, 52, 201, 0.5019607843137255),
  500: Color.fromRGBO(46, 8, 87, 0.6),
  600: Color.fromRGBO(201, 10, 10, 0.7019607843137254),
  700: Color.fromRGBO(73, 19, 19, 0.8),
  800: Color.fromRGBO(226, 22, 214, 0.9019607843137255),
  900: Color.fromRGBO(210, 95, 95, 1.0),
};
