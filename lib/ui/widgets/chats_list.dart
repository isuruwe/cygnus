import 'dart:async';
import 'dart:convert';

import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/data/model/chat_with_user.dart';
import 'package:cygnus/data/model/chats_observer.dart';
import 'package:cygnus/ui/widgets/chat_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatsList extends StatefulWidget {
  final List<ChatWithUser>? chatWithUserList;
  final Function(ChatWithUser) onChatWithUserTap;
  //final Function onChatWithUserTap;
  final String? myUserId;

  ChatsList(
      {required this.chatWithUserList,
        required this.onChatWithUserTap,
      required this.myUserId});

  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  ChatsObserver? _chatsObserver;
  UserProvider? _userProvider;
  AppUser? user;
  late StreamSubscription periodicSub;
  String? uid="";
  //List<ChatWithUser>? chatsList = [];
  List<StreamSubscription<ChatWithUser?>> subscriptionList = [];
  @override
  void initState() {
    super.initState();
   //  _userProvider = Provider.of<UserProvider>(context, listen: false);
   // // _chatsObserver = ChatsObserver(widget.chatWithUserList,context);
   //  gett2().then((data) {
   //    //setState(() {
   //      periodicSub = new Stream.periodic(const Duration(milliseconds: 5000))
   //          .take(999999999999999999)
   //          .listen((_) => gett());
   //   // });
   //  });
    //startObservers(chatUpdated);
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
  Future<List<ChatWithUser>?> gett() async {
    if(widget.chatWithUserList!=null){
    widget.chatWithUserList!.forEach((element) async {
      await _userProvider!.observechat(element.chat.id)
          .then((response) {
        response!.forEach((element1) async {
          if (element1.lastMessage == null ||
              element.chat.lastMessage == null ||
              (element1.lastMessage!.epochTimeMs !=
                  element.chat.lastMessage!.epochTimeMs)) {
            element.chat = element1;
            gett();
          }
        });
      });
    });
  }
  }


  @mustCallSuper
  @protected
  void dispose() {
   // _chatsObserver.removeObservers();
    super.dispose();
  }

  void chatUpdated() {
   // setState(() {});
  }

  bool changeMessageSeen(int index) {
    return widget.chatWithUserList![index].chat.lastMessage!.seen == false &&
        widget.chatWithUserList![index].chat.lastMessage!.senderId !=
            widget.myUserId;
  }

  // void startObservers(Function onChatUpdated) {
  //   widget.chatWithUserList!.forEach((element) {
  //     StreamSubscription<ChatWithUser?> chatSubscription =
  //          _userProvider!
  //         .observechat(element.chat.id).then((event) {
  //       Chat updatedChat = Chat.fromSnapshot(event);
  //
  //       if (updatedChat.lastMessage == null ||
  //           element.chat.lastMessage == null ||
  //           (updatedChat.lastMessage!.epochTimeMs !=
  //               element.chat.lastMessage!.epochTimeMs)) {
  //         element.chat = updatedChat;
  //         onChatUpdated();
  //       }
  //     });
  //
  //     subscriptionList.add(chatSubscription);
  //   });
  // }

  // void removeObservers() async {
  //   for (var i = 0; i < subscriptionList.length; i++) {
  //     await subscriptionList[i].cancel();
  //     subscriptionList.removeAt(i);
  //   }
  //
  //   subscriptionList ;
  //   widget.chatWithUserList ;
  // }

  Future calk(index) async{
  if (widget.chatWithUserList![index].chat.lastMessage != null &&
      changeMessageSeen(index)) {
    widget.chatWithUserList![index].chat.lastMessage!.seen = true;
    chatUpdated();
  }
  if( widget.onChatWithUserTap!=null){
    widget.onChatWithUserTap(widget.chatWithUserList![index]);


  }

}

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.grey),
      itemCount: widget.chatWithUserList!.length,
      itemBuilder: (BuildContext _, int index) => ChatListTile(
        chatWithUser: widget.chatWithUserList![index],
        onTap:  ()=>{calk(index)},
        onLongPress: () {},
        myUserId: widget.myUserId ?? '',
      ),
    );
  }
}
