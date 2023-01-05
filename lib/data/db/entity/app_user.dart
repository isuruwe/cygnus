//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class AppUser {
  String? id="";
  String? name="";
  int? age=0;
  String profilePhotoPath="";
  String? bio = "";
  String? pn = "";
  String? pt = "";
  AppUser(
      { this.id,
       this.name,
       this.age,
       required this.profilePhotoPath, this.bio, this.pn, this.pt});

  // AppUser.fromSnapshot(DocumentSnapshot? snapshot) {
  //   id = snapshot!['id'];
  //   name = snapshot['name'];
  //   age = snapshot['age'];
  //   profilePhotoPath = snapshot['profile_photo_path'];
  //   bio = snapshot.get('bio') ?? '';
  // }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['user_id'],
      name: json['name'].toString(),
      age: int.parse(json['age'].toString()) ,
      profilePhotoPath: imgpath+json['photo'].toString(),
      bio: json['introduction'].toString(),
      pn: json['phone'].toString(),
      pt: json['pt'].toString(),
    );

  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'profile_photo_path': profilePhotoPath,
      'bio': bio,
      'phone': pn,
      'pt': pt
    };
  }

  // factory AppUser.fromJson1(Map<String, dynamic> parsedJson) {
  //   return new AppUser(
  //       id: parsedJson['id'] ?? "",
  //       name: parsedJson['name'] ?? "",
  //       profilePhotoPath: parsedJson['profilePhotoPath'] ?? "",
  //       bio: parsedJson['bio'] ?? ""
  //
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'age': age,
  //     'profile_photo_path': profilePhotoPath,
  //     'bio': bio
  //   };
  // }



}
