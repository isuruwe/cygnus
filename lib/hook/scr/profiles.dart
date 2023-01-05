import 'package:cygnus/hook/utils/images.dart';

final List<Profile> demoProfile = [
  // new Profile(
  //     photos: [img1, img2, img3, img4],
  //     name: "Maugost Mtellect",
  //     bio: "Who wants to swim?",
  //     location: "Delta State",
  //     age: 25),
  // new Profile(
  //     photos: [img4, img3, img2, img1],
  //     name: "John Ebere",
  //     bio: "What's life with out fun?",
  //     location: "Kombe State",
  //     age: 22),
  // new Profile(
  //     photos: [img2, img3, img4, img1],
  //     name: "Jennifer Styles",
  //     bio: "just here to catch fun!",
  //     location: "Lagos State.",
  //     age: 23),
  // new Profile(
  //     photos: [img3, img1, img2, img4],
  //     name: "Ann Jose",
  //     bio: "Let's hang out!",
  //     location: "Abia State.",
  //     age: 20),
  // new Profile(
  //     photos: [img1, img4, img3, img2],
  //     name: "Jame Agwu",
  //     bio: "catching fun is my hobby!",
  //     location: "Rivers State.",
  //     age: 28)
];

class Profile {
  final List<String> photos;
  final String name;
  final int? age;
  final String bio;
  final String location;
  final String id;
  final String mto;
  final String lo;

  Profile({required this.id,required this.photos, required this.name, required this.age, required this.bio, required this.location, required this.mto, required this.lo});

  factory Profile.fromJson1(Map<String, dynamic> json) => Profile(
    id: json["id"] == null ? "" : json["id"],
    name: json["name"] == null ? "" : json["name"],
    bio: json["matchesu"] == null ? "" : json["matchesu"],
    location: json["location"] == null ? "" : json["location"],
    age: json["age"] == null ? 0 :int.parse( json["age"]) ,
    mto: json["matcheso"] == null ? "" : json["matcheso"],
    lo: json["date_year"] == null ? "" : json["date_year"],
    photos: json["photos"] == null ? "" : json["photos"].split(',').toList(),
  );
  Map<String, dynamic> toJson1() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "bio": bio == null ? null : bio,
    "location": location == null ? null : location,
    "age": age == null ? null : age,
    "matcheso": mto == null ? null : mto,
    "photos": photos == null ? null : photos,
  };

}
