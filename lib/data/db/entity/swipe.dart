// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Swipe {
//   String? id="";
//   bool liked=false;
//
//   Swipe(this.id, this.liked);
//
//   Swipe.fromSnapshot(DocumentSnapshot snapshot) {
//     id = snapshot['id'];
//     liked = snapshot['liked'];
//   }
//   Swipe.fromMap(Map<String, dynamic> map) {
//     id = map['id'];
//     liked = map['liked'];
//   }
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{'id': id, 'liked': liked};
//   }
// }
class swip {
  String id="";
  String userId="";
  String shortlistedBy="";
  String createdAt="";
  String updatedAt="";
  String liked="";

  swip(
      {required this.id,
        required this.userId,
        required this.shortlistedBy,
        required   this.createdAt,
        required this.updatedAt,
        required this.liked
      });

  swip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shortlistedBy = json['interested_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    liked = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['interested_by'] = this.shortlistedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.liked;
    return data;
  }
}
