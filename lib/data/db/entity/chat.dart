//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cygnus/data/db/entity/app_user.dart';

import 'message.dart';

class Chat {
  String id="";
  Message? lastMessage=null;
  AppUser? apu=null;
  Chat(this.id, this.lastMessage);

  // Chat.fromSnapshot(DocumentSnapshot snapshot) {
  //   id = snapshot['id'];
  //   lastMessage = snapshot['last_message'] != null
  //       ? Message.fromMap(snapshot['last_message'])
  //       : null;
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'last_message': lastMessage != null ? lastMessage!.toMap() : null,
    };
  }


  Chat.fromJson(Map<String, dynamic> json) {
    id =  json['id'];
    lastMessage=new Message(int.parse(json['epoch_time_ms']), int.parse(json['seen'])==1?true:false, '0', json['message'], '0');
    apu=AppUser(id:json['user_id'], name:json['name'], age:int.parse(json['age']), profilePhotoPath:json['photo'],bio: json['introduction']);
  //lastMessage?.text = json['message'];

  }



}
