//import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  int epochTimeMs=0;
  bool seen=false;
  String senderId="";
  String text="";
  String chat_thread_id="";
  Message(this.epochTimeMs, this.seen, this.senderId, this.text,this.chat_thread_id);

  Message.fromMap(Map<String, dynamic> map) {
    epochTimeMs = map['epoch_time_ms'];
    seen = map['seen'];
    senderId = map['sender_id'];
    text = map['text'];
    chat_thread_id = map['id'];
  }
  Message.fromJson(Map<String, dynamic> json) {
    epochTimeMs =  int.parse(json['epoch_time_ms']);
    seen = int.parse(json['seen'])==1?true:false;
    senderId = json['sender_user_id'];
    text = json['message'];
    chat_thread_id = json['id'];
  }
  // Message.fromSnapshot(DocumentSnapshot snapshot) {
  //   epochTimeMs = snapshot['epoch_time_ms'];
  //   seen = snapshot['seen'];
  //   senderId = snapshot['sender_id'];
  //   text = snapshot['text'];
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'epoch_time_ms': epochTimeMs,
      'seen': seen,
      'sender_id': senderId,
      'text': text,
      'id':chat_thread_id
    };
  }
}
