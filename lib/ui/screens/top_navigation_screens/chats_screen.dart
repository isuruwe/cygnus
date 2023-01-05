import 'dart:async';
import 'dart:convert';

import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/model/chat_with_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/chat_screen.dart';
import 'package:cygnus/ui/widgets/chats_list.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/utils.dart';

class ChatsScreen extends StatefulWidget {

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>  with AutomaticKeepAliveClientMixin<ChatsScreen>{
  List<ChatWithUser> chatWithUserList = [];
  UserProvider? _userProvider;
  AppUser? user;
  late StreamSubscription periodicSub;



  void chatWithUserPressed(ChatWithUser chatWithUser)  {
   // AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;

    // Navigator.pushNamed(context, ChatScreen.id, arguments: {
    //   "chat_id": chatWithUser.chat.id,
    //   "user_id": user!.id,
    //   "other_user_id": chatWithUser.user!.id
    // });
   // Navigator.pop(context);
    Navigator.pushNamed(context, ChatScreen.id, arguments: {
      "chat_id": compareAndCombineIds( user!.id, chatWithUser.user!.id),
      "user_id":  user!.id,
      "other_user_id": chatWithUser.user!.id
    });

  }
  @override
  void initState()  {
    super.initState();

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    // gett2().then((data) {
    //  // setState(() {
    //
    //    // chatWithUserList=data;
    //
    //
    // //  });
    // });
         periodicSub = new Stream.periodic(const Duration(milliseconds: 1000))
             .take(999999999999999999)
             .listen((_) => gett2());



  }

  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String?, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  Future<List<ChatWithUser>>  gett2() async {


    var uid= (await SharedPreferencesUtil.getUserId());
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user').toString()).first;
   await _userProvider!.getmatches(user!.id).then((response) {
      if(response!=null){
        // _isLoading = false;
        setState(() {
          chatWithUserList = response;
        });
      }
      return response;
    });
    return chatWithUserList;

  }

  // Future<AppUser?>? gett3() async {
  //
  //   _userProvider!.getUser().then((value) {
  //     setState(() {
  //       user = value!;
  //       // Future is completed with a value.
  //     });
  //   });
  //   return user;
  // }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    if(chatWithUserList.length>0){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child:
        ChatsList(
          chatWithUserList:
          chatWithUserList,
          onChatWithUserTap:
            chatWithUserPressed
          ,
          myUserId: user!.id,
        )
      ),
    );
    }else{
      return Scaffold(
        body:  Center( child: Text("Chat Box",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );
    }
    //     Consumer<UserProvider>(
    //       builder: (context, userProvider, child) {
    //         return FutureBuilder<AppUser?>(
    //           future:  gett2(),
    //           builder: (context, userSnapshot) {
    //             return CustomModalProgressHUD(
    //               inAsyncCall:
    //                   userProvider.user == null || userProvider.isLoading,
    //
    //               child: chatWithUserList?
    //               ChatsList(
    //                                 chatWithUserList:
    //                                     chatWithUserList,
    //                                 onChatWithUserTap: chatWithUserPressed,
    //                                 myUserId: userSnapshot.data!.id,
    // )    : Container(),



                      // ? FutureBuilder<List<ChatWithUser>>(
                      //     future: userProvider
                      //         .getChatsWithUser(userSnapshot.data!.id),
                      //     builder: (context, chatWithUsersSnapshot) {
                      //       if (chatWithUsersSnapshot.data == null) {
                      //         return CustomModalProgressHUD(
                      //             inAsyncCall: true, child: Container());
                      //       }
                      //       else {
                      //         return chatWithUsersSnapshot.data!.length == 0
                      //             ? Center(
                      //                 child: Container(
                      //                     child: Text('No Messages',
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .headline4),color: Colors.black,),
                      //               )
                      //             : ChatsList(
                      //                 chatWithUserList:
                      //                     chatWithUsersSnapshot.data,
                      //                 onChatWithUserTap: chatWithUserPressed,
                      //                 myUserId: userSnapshot.data!.id,
                      //               );
                      //       }
                      //     })



        //         );
        //       },
        //     );
        //   },
        // ),

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
