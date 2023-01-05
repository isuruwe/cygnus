import 'dart:convert';


import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/db/entity/chat.dart';
import 'package:cygnus/data/db/entity/match.dart';
import 'package:cygnus/data/db/entity/swipe.dart';
import 'package:cygnus/data/db/remote/firebase_database_source.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/matched_screen.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/ui/widgets/swipe_card.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  //final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
   List<String?> _ignoreSwipeIds=<String>[];
  UserProvider? _userProvider;
  bool _isLoading = false;
  AppUser? user;
  Future<AppUser?>? appUser;
  LanguageChangeProvider? appLanguage;
  @override
  void initState() {

    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
    gett().then((data) {
      setState(() {
        this.user = data;
        appUser= loadPerson(user!.id);
      });
    });
  }

  Future<AppUser?> gett() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return user;
  }
  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  Future<AppUser?> loadPerson(String? myUserId) async {
    List<AppUser> appUser1 =[];
    _isLoading = true;
    if (_ignoreSwipeIds == null||_ignoreSwipeIds.length==0) {
      _ignoreSwipeIds = <String>[];
     // var swipes = await _databaseSource.getSwipes(myUserId);


      await _userProvider!
          .getswip(user!.id)
          .then((response) {
        if(response==null){

          //showSnackBar(context, 'failed!');

          //_isLoading = false;
        }
        else{
          final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
          List<swip> swipes =parsed.map<swip>((json) => swip.fromJson(json)).toList();
          //var swipes =response;
          for (var i = 0; i < swipes.length; i++) {

            _ignoreSwipeIds.add(swipes.elementAt(i).userId);
          }
        //  _isLoading = false;
        }
      });
    //  _isLoading = false;

      _ignoreSwipeIds.add(myUserId);
    }
    await _userProvider!
        .getPersonsToMatchWith(1,_ignoreSwipeIds)
        .then((response) {
      if(response==null){

        //showSnackBar(context, 'failed!');

       // _isLoading = false;
      }
      else{
        final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
         appUser1 =parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
        //var swipes =response;
      //  _isLoading = false;
        return appUser1.first;

      }
    });
    _isLoading = false;
    return appUser1.first;

  }

  void personSwiped(AppUser? myUser, AppUser? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    _isLoading = true;
    await _userProvider!
        .insertswip(myUser!.id,otherUser!.id,isLiked.toString())
        .then((response) {
      if(response!=null){
       // _isLoading = false;

      }
      });

  //  _isLoading = false;
    _ignoreSwipeIds.add(otherUser.id);

    if (isLiked == true) {
      if (await isMatch(myUser, otherUser) == true) {
      //  _databaseSource.addMatch(myUser.id, Match(otherUser.id));

        await _userProvider!
            .insertmatch(myUser.id,otherUser.id)
            .then((response) {
          if(response!=null){
          //  _isLoading = false;

          }
        });
        await _userProvider!
            .insertmatch(otherUser.id,myUser.id)
            .then((response) {
          if(response!=null){

          //  _isLoading = false;
          }
        });
       // _databaseSource.addMatch(otherUser.id, Match(myUser.id));
        String chatId = compareAndCombineIds(myUser.id, otherUser.id);
     //   _databaseSource.addChat(Chat(chatId, null));
       // _isLoading = false;
        Navigator.pushNamed(context, MatchedScreen.id, arguments: {
          "my_user_id": myUser.id,
          "my_profile_photo_path": myUser.profilePhotoPath,
          "other_user_profile_photo_path": otherUser.profilePhotoPath,
          "other_user_id": otherUser.id
        });
      }
    }
    else{
     // _isLoading = false;
      appUser=  loadPerson(user!.id);

    }
    _isLoading = false;
    setState(() {});
  }

  Future<bool> isMatch(AppUser myUser, AppUser otherUser) async {
    // DocumentSnapshot swipeSnapshot =
    //     await _databaseSource.getSwipe(otherUser.id, myUser.id);
    _isLoading = true;
     // swip swipe = Swipe.fromSnapshot(swipeSnapshot);
      await _userProvider!
          .getswipid(otherUser.id, myUser.id)
          .then((response) {
        if(response==null){

          //showSnackBar(context, 'failed!');
          return false;
          _isLoading = false;
        }
        else{
          final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
          List<swip> swipes =parsed.map<swip>((json) => swip.fromJson(json)).toList();
          //var swipes =response;
        if(swipes.length>0) {
          if (swipes.first.liked == true) {
            //_isLoading = false;
            return true;
          }
          else{
           // _isLoading = false;
            return false;

          }}
        }
      });
    _isLoading = false;
      return false;





  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return FutureBuilder<AppUser?>(
              future: null,
              builder: (context, userSnapshot) {
                return CustomModalProgressHUD(
                  inAsyncCall:
                      userProvider.user == null || userProvider.isLoading,
                  child: (userSnapshot.hasData)
                      ? FutureBuilder<AppUser?>(
                          future: appUser,
                          builder: (context, snapshot) {
                // if (snapshot.connectionState ==
                //         ConnectionState.done &&
                //     !snapshot.hasData) {
                //   return Center(
                //     child: Container(
                //         child: Text('No users',
                //             style: TextStyle(color:Colors.black ))),
                //   );
                // }
                if (!snapshot.hasData) {
                return CustomModalProgressHUD(
                inAsyncCall: true,
                child: Container(
                    child: Text('No new users swipe tommoroow', style: TextStyle(color:Colors.black )),

                ),
                );
                }
                else{
                return
                 CustomModalProgressHUD(
                  inAsyncCall: _isLoading,
                  child:

                  Container(
                child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                SwipeCard(person: snapshot.data),
                Expanded(
                child: Container(
                margin: EdgeInsets.symmetric(
                horizontal: 45),
                child: Align(
                alignment: Alignment.center,
                child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                RoundedIconButton(
                onPressed: () {
                personSwiped(
                userSnapshot.data,
                snapshot.data,
                false);
                },
                iconData: Icons.clear,
                buttonColor:
                kColorPrimaryVariant,
                iconSize: 30,
                ),
                RoundedIconButton(
                onPressed: () {
                personSwiped(
                userSnapshot.data,
                snapshot.data,
                true);
                },
                iconData: Icons.favorite,
                iconSize: 30, buttonColor: Colors.black,
                ),
                ],
                ),
                ),
                ),
                ),

                /*    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RoundedIconButton(
                                          onPressed: () {
                                            personSwiped(
                                                userSnapshot.data,
                                                snapshot.data,
                                                false);
                                          },
                                          iconData: Icons.clear,
                                          buttonColor:
                                              kColorPrimaryVariant,
                                          iconSize: 30,
                                        ),
                                        RoundedIconButton(
                                          onPressed: () {
                                            personSwiped(
                                                userSnapshot.data,
                                                snapshot.data,
                                                true);
                                          },
                                          iconData: Icons.favorite,
                                          iconSize: 30,
                                        ),
                                      ],
                                      ),*/
                ],
                ),
                ),
                ),),
                );
                }
                          })
                      : Container(),
                );
              },
            );
          },
        )));
  }
}
