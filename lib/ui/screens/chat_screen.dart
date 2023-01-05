import 'dart:async';
import 'dart:convert';

import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/db/entity/chat.dart';
import 'package:cygnus/data/db/entity/message.dart';
import 'package:cygnus/data/db/remote/firebase_database_source.dart';
import 'package:cygnus/ui/widgets/chat_top_bar.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/ui/widgets/message_bubble.dart';
import 'package:cygnus/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  final String chatId;
  final String myUserId;
  final String otherUserId;
  ChatScreen(
      {required this.chatId,
        required this.myUserId,
        required this.otherUserId});
  @override
  _ChatScreen createState() => _ChatScreen();



}


class _ChatScreen  extends State<ChatScreen> {
  final ScrollController _scrollController = new ScrollController();
  //final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final messageTextController = TextEditingController();
  UserProvider? _userProvider;
  AppUser? user;
  late StreamSubscription periodicSub;
  String? uid="";
  List<Message>? mm;




  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
      setState(() {
        periodicSub = new Stream.periodic(const Duration(milliseconds: 5000))
            .take(999999999999999999)
            .listen((_) => gett());
      });
    });




  }

  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  Future<String?> gett2() async {


    uid= (await SharedPreferencesUtil.getUserId());
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return uid;
  }
  Future<void> checkAndUpdateLastMessageSeen(
      Message lastMessage, String messageId, String myUserId) async {
    if (lastMessage.seen == false && lastMessage.senderId != myUserId) {
      lastMessage.seen = true;
      Chat updatedChat = Chat(widget.chatId, lastMessage);
      await _userProvider!
        .updatechat(widget.chatId,messageId,lastMessage.seen.toString())
        .then((response) {


    });
     // _databaseSource.updateChat(updatedChat);
     // _databaseSource.updateMessage(chatId, messageId, lastMessage);
    }
  }

  bool shouldShowTime(Message currMessage, Message messageBefore) {
    int halfHourInMilli = 1800000;

    if (messageBefore != null) {
      if ((messageBefore.epochTimeMs - currMessage.epochTimeMs).abs() >
          halfHourInMilli) {
        return true;
      }
    }
    return messageBefore == null;
  }


  Future<List<Message>?> gett() async {
      await _userProvider!
          .observeMessages(widget.chatId)
          .then((response) {
        setState(() {
          mm=response;
       });

      });

    }




  @override
  Widget build(BuildContext context) {
    if (mm == null) {
      gett();
      return   Scaffold(
        body:   Column(children:[Padding(padding: EdgeInsets.only(top: 20.0,bottom:350.0,left: 500.0 )),CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 1,
        ),] ),
      );
    }
    if (mm != null) {
    if (mm!.length > 0) {
      checkAndUpdateLastMessageSeen(
          mm!.first, mm![0].chat_thread_id, widget.myUserId);
      // }
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0.0);
      }
      List<bool> showTimeList = List<bool>.filled(
          mm!.length, true, growable: true);

      for (int i = mm!.length - 1; i >= 0; i--) {
        bool shouldShow = i == (mm!.length - 1)
            ? true
            : shouldShowTime(mm![i], mm![i + 1]);
        showTimeList[i] = shouldShow;
      }

      return Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white70,
              title: FutureBuilder<AppUser?>(
                  future: _userProvider!.observeUser(widget.otherUserId),

                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return ChatTopBar(user: snapshot.data);
                  })
          ),
          body: Column(
              children: [
                Expanded(
                  child:

                  //StreamBuilder<QuerySnapshot>(
                  // stream: _databaseSource.observeMessages(chatId),
                  // builder: (context, snapshot) {
                  //   if (!snapshot.hasData) return Container();
                  //   List<Message> messages = [];
                  //   snapshot.data!.docs.forEach((element) {
                  //     //messages.add(Message.fromSnapshot(element));
                  //   });
                  //   if (snapshot.data!.docs.length > 0) {
                  //     checkAndUpdateLastMessageSeen(
                  //         messages.first, snapshot.data!.docs[0].id, myUserId);
                  //   }
                  //   if (_scrollController.hasClients)
                  //     _scrollController.jumpTo(0.0);
                  //
                  //   List<bool> showTimeList =  List<bool>.filled(messages.length,true,growable: true);
                  //
                  //   for (int i = messages.length - 1; i >= 0; i--) {
                  //     bool shouldShow = i == (messages.length - 1)
                  //         ? true
                  //         : shouldShowTime(messages[i], messages[i + 1]);
                  //     showTimeList[i] = shouldShow;
                  //   }
                  //   return ListView.builder(
                  //     shrinkWrap: true,
                  //     reverse: true,
                  //     controller: _scrollController,
                  //     itemCount: messages.length,
                  //     itemBuilder: (context, index) {
                  //       final item = messages[index];
                  //       return ListTile(
                  //         title: MessageBubble(
                  //             epochTimeMs: item.epochTimeMs,
                  //             text: item.text,
                  //             isSenderMyUser:
                  //                 messages[index].senderId == myUserId,
                  //             includeTime: showTimeList[index]),
                  //       );
                  //     },
                  //   );
                  // }),
                  //////////////////////////////
                  // FutureBuilder<List<Message>?>(
                  //     future: mm,
                  //
                  //     builder: (context, snapshot) {
                  // (() {

                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    controller: _scrollController,
                    itemCount: mm!.length,
                    addAutomaticKeepAlives: true,
                    itemBuilder: (context, index) {
                      final item = mm![index];
                      return ListTile(textColor: Colors.black,
                        title: MessageBubble(
                            epochTimeMs: item.epochTimeMs,
                            text: item.text,
                            isSenderMyUser:
                            mm![index].senderId == widget.myUserId,
                            includeTime: showTimeList[index]),
                      );
                    },

                  ),
                  // })
                  // }())

                ),
                getBottomContainer(context, widget.myUserId)
              ]));
    } else {
      return Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white70,
              title: FutureBuilder<AppUser?>(
                  future: _userProvider!.observeUser(widget.otherUserId),

                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return ChatTopBar(user: snapshot.data);
                  })
          ),
          body:

             Scaffold(
          body:   Column(children:[Padding(padding: EdgeInsets.only(top: 20.0,bottom:350.0,left: 500.0 )),CircularProgressIndicator(
    backgroundColor: Colors.white,
    strokeWidth: 1,
    ),] ),
    ),

      );
    }
  }
    else{
      return   Scaffold(
        body:   Column(children:[Padding(padding: EdgeInsets.only(top: 20.0,bottom:350.0,left: 500.0 )),CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 1,
        ),] ),
      );
    }
  }

  Future<void> sendMessage(String myUserId) async {
    if (messageTextController.text.isEmpty) return;

    Message message = Message(DateTime.now().millisecondsSinceEpoch, false,
        myUserId, messageTextController.text,widget.chatId);
    Chat updatedChat = Chat(widget.chatId, message);
    // _databaseSource.addMessage(chatId, message);
    // _databaseSource.updateChat(updatedChat);
    await _userProvider!
        .addMessage(widget.chatId,message)
        .then((response) {


    });
    await _userProvider!
        .sendmsg(widget.otherUserId,'User has sent you a message!')
        .then((response) {
      if(response!=null){
        // _isLoading = false;

      } });
    messageTextController.clear();
    setState(() {});
  }
  @override
  void dispose() {
    periodicSub.cancel();
    super.dispose();
  }
  Widget getBottomContainer(BuildContext context, String myUserId) {
    return Container(
      decoration: BoxDecoration(color:Color(0xFFFecf0c2) ,
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.green,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: messageTextController,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(fillColor: Colors.black,
                    labelText: 'Message',
                    labelStyle:
                        TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(0)),
              ),
            ),
            ElevatedButton(
             style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,padding: EdgeInsets.all(10),elevation: 0,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),),
              // padding: EdgeInsets.all(10),
              // highlightElevation: 0,
              // elevation: 0,
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(4)),
              child: Text(
                "SEND",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                sendMessage(myUserId);
              },
            ),
          ],
        ),
      ),
    );
  }
}


