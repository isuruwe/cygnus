import 'package:flutter/material.dart';
import 'package:cygnus/hook/utils/images.dart';

class IndexData {
  String assetLink;
  String title;
  String subTitle;
  Color color;

  IndexData({required this.assetLink, required this.title, required this.subTitle, required this.color});
}

List<IndexData> index_data = [
  IndexData(
      assetLink: img2,
      title: "Life is too short",
      subTitle: "Not to get laid",
      color: Colors.lightBlue),
  IndexData(
      assetLink: img1,
      title: "Make new discoveries",
      subTitle: "Find interesting people around you",
      color: Colors.blue),
  IndexData(
      assetLink: swipe,
      title: "Get Laid",
      subTitle: "Swipe Right to get laid,\n or Swipe Left to pass",
      color: Colors.green),
  IndexData(
      assetLink: match,
      title: "It's a Match!",
      subTitle: "if they also Swipe Right, it's a match!",
      color: Colors.brown)
];
