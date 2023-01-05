import 'dart:convert';

import 'package:cygnus/data/model/maril.dart';
import 'package:cygnus/data/model/rel.dart';

class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String verified;
  final String matcho;
  final String cntry;
  final List<String> image;
  final String lo;
  final String req;
  final String pn;
  final String cncode;
  final String arpm;
  const Planet(
      {required this.id,
      required this.name,
      required this.location,
      required this.distance,
      required this.gravity,

      required this.description,
        required this.verified,
        required this.matcho,
        required this.cntry,
      required this.image,
  required this.lo,
  required this.req,
        required this.pn,
        required this.cncode,
        required this.arpm
      });

  factory Planet.fromJson1(Map<String, dynamic> json) => Planet(
        id: json["id"] == null ? "" : json["id"],
        name: json["name"] == null ? "" : json["name"],
        location: json["location"] == null ? "" : json["location"],
        distance: json["age"] == null ? "" : json["age"],
      cntry: json["cnttry"] == null ? "" : json["cnttry"],
        gravity: json["matchesu"] == null ? "0" : json["matchesu"],
    matcho: json["matcheso"] == null ? "0" : json["matcheso"],
    lo: json["date_year"] == null ? "" : json["date_year"],
    req: json["req"] == null ? "" : json["req"],
    image: json["photos"] == null ? "" : json["photos"].split(',').toList(),
        description: json["online"] == null ? "" : json["online"],
    verified: json["verified"] == null ? "" : json["verified"],
    pn: json["phone"] == null ? "" : json["phone"],
    cncode: json["cnttryc"] == null ? "" : json["cnttryc"],
    arpm: json["arpm"] == null ? "" : json["arpm"],
      );
  Map<String, dynamic> toJson1() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "matches": gravity == null ? null : gravity,
        "location": location == null ? null : location,
        "age": distance == null ? null : distance,
        "photos": image == null ? null : image,
        "online": description == null ? null : description,
    "verified": verified == null ? null : verified,
      };




}




List<Planet> PlanetFromJson1(String str) =>
    List<Planet>.from(json.decode(str).map((x) => Planet.fromJson1(x)));


String PlanetToJson1(List<Planet> data) =>
    json.encode(List<Planet>.from(data.map((x) => x.toJson1())));




List<Planet> planets = [];
List<Planet> planetsb = [];
List<Planet> planetsrq = [];
List<Planet> planetsrc = [];
List<Planet> planetbl = [];
List<Planet> planetsm = [];
List<rel> religions=[];
List<maril> marils=[];
List<maril> onbefs=[];
List<maril> curry=[];
List<maril> edulis=[];
List<maril> langs=[];
List<String> langst=[];
//   const Planet(
//     id: "1",
//     name: "Mars",
//     location: "Milkyway Galaxy",
//     distance: "54.6m Km",
//     gravity: "3.711 m/s ",
//     description: "Lorem ipsum...",
//     image: "assets/images/info.png",
//   ),
//   const Planet(
//     id: "2",
//     name: "Neptune",
//     location: "Milkyway Galaxy",
//     distance: "54.6m Km",
//     gravity: "3.711 m/s ",
//     description: "Lorem ipsum...",
//     image: "assets/images/phonr.png",
//   ),
//   const Planet(
//     id: "3",
//     name: "Moon",
//     location: "Milkyway Galaxy",
//     distance: "54.6m Km",
//     gravity: "3.711 m/s ",
//     description: "Lorem ipsum...",
//     image: "assets/images/tw.png",
//   ),
//   const Planet(
//     id: "4",
//     name: "Earth",
//     location: "Milkyway Galaxy",
//     distance: "54.6m Km",
//     gravity: "3.711 m/s ",
//     description: "Lorem ipsum...",
//     image: "assets/images/fb.png",
//   ),
//   const Planet(
//     id: "5",
//     name: "Mercury",
//     location: "Milkyway Galaxy",
//     distance: "54.6m Km",
//     gravity: "3.711 m/s ",
//     description: "Lorem ipsum...",
//     image: "assets/images/gg.png",
//   ),
// ];
