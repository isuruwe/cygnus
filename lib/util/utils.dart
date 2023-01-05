import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext globalKey, String message) {
  //final snackBar = SnackBar(content: Text(message));
  final snackBar = SnackBar(content: Text(message));
  //ScaffoldMessenger.of( globalKey.currentState!.context).showSnackBar(snackBar);
  //ScaffoldMessenger.of( globalKey.currentState!.context).hideCurrentSnackBar();
 // globalKey.currentState!.showSnackBar(snackBar);
  ScaffoldMessenger.of(globalKey).showSnackBar(snackBar);
}

String compareAndCombineIds(String? userID1, String? userID2) {
  if (userID1!.compareTo(userID2!) < 0) {
    return userID2 + userID1;
  } else {
    return userID1 + userID2;
  }
}

String convertEpochMsToDateTime(int epochMs) {
  //int oneDayInMs = 86400000;
  //var date = DateTime.fromMillisecondsSinceEpoch(epochMs);
 // int currentTimeMs = DateTime.now().millisecondsSinceEpoch;
  // if ((currentTimeMs - epochMs) >= oneDayInMs) {
  //   return '${DateFormat.yMd().format(date)}  ${DateFormat.jm().format(date)}';
  // } else {
  //   return DateFormat.jm().format(date);
  // }
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(epochMs*1000, isUtc: true);
  var format = new DateFormat("yyyy MMM dd HH:mm:ss");
  var dateString = format.format(date);
  return dateString;
}
