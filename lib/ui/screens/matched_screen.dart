import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/chat_screen.dart';
import 'package:cygnus/ui/widgets/portrait.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchedScreen extends StatelessWidget {
  static const String id = 'matched_screen';

  final String myProfilePhotoPath;
  final String? myUserId;
  final String otherUserProfilePhotoPath;
  final String otherUserId;

  MatchedScreen(
      {required this.myProfilePhotoPath,
      required this.myUserId,
      required this.otherUserProfilePhotoPath,
      required this.otherUserId});

  void sendMessagePressed(BuildContext context) async {
  // AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;

    Navigator.pop(context);
    Navigator.pushNamed(context, ChatScreen.id, arguments: {
      "chat_id": compareAndCombineIds(myUserId, otherUserId),
      "user_id": myUserId,
      "other_user_id": otherUserId
    });
  }



  void keepSwipingPressed(BuildContext context) {
//    Navigator.pop(context);
    Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  TopNavigationScreen(1,0,0)));


  }

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
        decoration: const BoxDecoration(
        color: kColorPrimaryVariant,

    ),
    child:

      Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 42.0,
            horizontal: 18.0,
          ),
          margin: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "It's a Match",
                style: TextStyle(fontSize: 40.0, color: Colors.pink),
              ),
              Image.asset('assets/images/tinder_icon.png', width: 100),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Portrait(imageUrl: myProfilePhotoPath),
                    Portrait(imageUrl: otherUserProfilePhotoPath)
                  ],
                ),
              ),
              Column(
                children: [
                  RoundedButton(
                      text: 'SEND MESSAGE',
                      onPressed: () {
                        sendMessagePressed(context);
                      }),
                  SizedBox(height: 10),
                  RoundedOutlinedButton(
                      text: 'KEEP SWIPING',
                      onPressed: () {
                        keepSwipingPressed(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
