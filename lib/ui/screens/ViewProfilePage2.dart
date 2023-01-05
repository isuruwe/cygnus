import 'dart:convert';
//import 'dart:html';
import 'dart:ui' as ui;
import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/db/entity/message.dart';
import 'package:cygnus/data/db/entity/swipe.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/fav.dart';
import 'package:cygnus/ui/screens/register_sub_screens/add_photo_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/UpdatePhoto.dart';
import 'package:cygnus/ui/screens/viewphoto.dart';
import 'package:cygnus/ui/widgets/BorderedTextField2.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:enough_mail/mail_address.dart';
import 'package:enough_mail/message_builder.dart';
import 'package:enough_mail/smtp/smtp_client.dart';
import 'package:enough_mail/smtp/smtp_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../data/model/planets.dart';
import '../../hook/scr/round_icon_button.dart';
import '../pkg.dart';
import '../widgets/rounded_button.dart';
import 'chat_screen.dart';
import 'matched_screen.dart';





class ViewProfilePage2 extends StatefulWidget {
  static const String id = 'ViewProfilePage2';
  final String? uidnew;
  final Function() notifyParent1;
  ViewProfilePage2(
      {required this.uidnew, required this.notifyParent1,
       });


  @override
  _ViewProfilePageState2 createState() => _ViewProfilePageState2();
}

class _ViewProfilePageState2 extends State<ViewProfilePage2> {
  bool showPassword = false;
  DateTime selectedDate = DateTime.now();
  List<String?> _ignoreSwipeIds=<String>[];

  PhoneNumberUtil plugin =new PhoneNumberUtil();

  final UserRegistration _userRegistration = UserRegistration();
  String countryValue="";

  String? cityValue="";

  String? stateValue="";
  String countryValue2="";

  String? cityValue2="";

  String? stateValue2="";
  String reqst="";
  String bkt="";
  String blk="";
  String phone="";
  String stclr="";
  String ctcode="";
  var dateTime1;
  String textcode="";
  UserProvider? _userProvider;

  String? uid="";
  String? uid1="";
  userdet? userdet1;
  AppUser? user;
  bool _isLoading=false;
String? gen='';
  RangeValues _currentRangeValues = const RangeValues(16, 60);

  @override
  void initState()  {

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2(context).then((data) {
     // setState(() {


        gett(data).then((data2) {
          setState(() {


userdet1=data2;
reqst=userdet1?.reqq??'';
bkt=userdet1?.bk??'';
if(userdet1?.gender=='1'){
gen='Male';
}
if(userdet1?.gender=='2'){
  gen='Female';
}
dateTime1  = DateTime.tryParse(userdet1?.birthday??"");

          });
      ///  });



      });
    });
    super.initState();
  }
  Future<String?> gettt(String? uid,String? mid) async {
    String? fg;
    await _userProvider!
        .getreqst(uid,mid)
        .then((response) {
fg=response;
      return response;
    });

    return fg;
  }
  @override
  void dispose() {


    super.dispose();
  }
  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Row(
          children: <Widget>[

            // FutureBuilder(
            //   future: gettt(uid1,uid),
            //   builder: (context, snapshot) {
            //
            //     if (snapshot.hasData) {
            //       if (snapshot.data.toString().isEmpty&&snapshot.data.toString()!="1") {
            //         return new Row (
            //             children: <Widget>[ new Text(
            //               'Accept Request',
            //               style: TextStyle(fontSize: 14, color: Colors.lightBlue),
            //             ),
            //               new SizedBox(
            //                 width: 10.0,
            //               ),
            //               new RoundIconButton.small(
            //                 icon: Icons.approval,
            //                 iconColor: Colors.red,
            //                 onPressed: () {
            //                   // Navigator.of(context)
            //                   //     .push(MaterialPageRoute (
            //                   //   builder: (BuildContext context) =>  SettingsPage(),
            //                   // ),);
            //                   // sendMessagePressed(context);
            //                   personSwiped(uid1,uid,false);
            //                 }, imageAsset: 'assets/shield.png',
            //               ),
            //             ]  );
            //
            //       } else {
            //         return Text(
            //           "",
            //           style: TextStyle(fontSize: 20, color: Colors.lightBlue),
            //         );
            //       }
            //     } else {
            //       return Text(
            //         '',
            //         style: TextStyle(fontSize: 5, color: Colors.lightBlue),
            //       );
            //     }
            //   },
            // ),
            // new RoundIconButton.small(
            //   icon: Icons.settings,
            //   iconColor: Colors.green,
            //   onPressed: () {
            //
            //
            //   }, imageAsset: 'assets/images/couple.png',
            // ),
            SizedBox(width: 20,),
            new RoundIconButton.small(
              icon: Icons.settings,
              bColor:reqst!= '1' ? Colors.white : Colors.green,
              iconColor:Colors.red,
              onPressed: () {

                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                if(reqst=='0'){

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return    AlertDialog(
                          title: Text("Sending Request"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Tune lets you find best matches suits to you.Are you sure want send request to this user??")
                            ],
                          ),
                          actions: [
                            RoundedOutlinedButton(
                              onPressed: () {
                                bool cansend=false;
                                bool canpdsr=false;
                                bool canmaxpr=false;
                                bool canarpm=true;
                                if(pstate2=='Free Package'||pstate2==''){

                                    if(userdet1?.pdsr!=null){
                                      int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                                      if(pdsr2<1){
                                        cansend=true;
                                        canpdsr=true;
                                      }

                                    }
                                    if(userdet1?.maxpr!=null){
                                      int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                                      if(maxpr2<2){
                                        cansend=true;
                                        canmaxpr=true;
                                      }

                                    }
                                    if(userdet1?.arpm!=null){
                                      int arpm2= int.parse(userdet1!.arpm.toString()) ;
                                      if(arpm2<2){
                                        cansend=true;
                                        canarpm=true;
                                      }

                                    }

                                }
                                if(pstate2=='Bronze Package'){
                                  if(userdet1?.pdsr!=null){
                                    int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                                    if(pdsr2<2){
                                      cansend=true;
                                      canpdsr=true;
                                    }

                                  }
                                  if(userdet1?.maxpr!=null){
                                    int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                                    if(maxpr2<3){
                                      cansend=true;
                                      canmaxpr=true;
                                    }

                                  }
                                  if(userdet1?.arpm!=null){
                                    int arpm2= int.parse(userdet1!.arpm.toString()) ;
                                    if(arpm2<4){
                                      cansend=true;
                                      canarpm=true;
                                    }

                                  }

                           }
                           if(pstate2=='Silver Package'){
                             if(userdet1?.pdsr!=null){
                               int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                               if(pdsr2<3){
                                 cansend=true;
                                 canpdsr=true;
                               }

                             }
                             if(userdet1?.maxpr!=null){
                               int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                               if(maxpr2<4){
                                 cansend=true;
                                 canmaxpr=true;
                               }

                             }
                             if(userdet1?.arpm!=null){
                               int arpm2= int.parse(userdet1!.arpm.toString()) ;
                               if(arpm2<6){
                                 cansend=true;
                                 canarpm=true;
                               }

                             }

                           }
                           if(pstate2=='Gold Package'){
                             if(userdet1?.pdsr!=null){
                               int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                               if(pdsr2<15){
                                 cansend=true;
                                 canpdsr=true;
                               }

                             }
                             if(userdet1?.maxpr!=null){
                               int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                               if(maxpr2<15){
                                 cansend=true;
                                 canmaxpr=true;
                               }

                             }
                             if(userdet1?.arpm!=null){
                               int arpm2= int.parse(userdet1!.arpm.toString()) ;
                               if(arpm2<15){
                                 cansend=true;
                                 canarpm=true;
                               }

                             }

                           }
                           if(pstate2=='Platinum Package'){
                             if(userdet1?.pdsr!=null){
                               int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                               if(pdsr2<25){
                                 cansend=true;
                                 canpdsr=true;
                               }

                             }
                             if(userdet1?.maxpr!=null){
                               int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                               if(maxpr2<25){
                                 cansend=true;
                                 canmaxpr=true;
                               }

                             }
                             if(userdet1?.arpm!=null){
                               int arpm2= int.parse(userdet1!.arpm.toString()) ;
                               if(arpm2<25){
                                 cansend=true;
                                 canarpm=true;
                               }

                             }

                           }
                                if(pstate2=='Loyalty Member Package'){
                                  if(userdet1?.pdsr!=null){
                                    int pdsr2= int.parse(userdet1!.pdsr.toString()) ;
                                    if(pdsr2<50){
                                      cansend=true;
                                      canpdsr=true;
                                    }

                                  }
                                  if(userdet1?.maxpr!=null){
                                    int maxpr2= int.parse(userdet1!.maxpr.toString()) ;
                                    if(maxpr2<50){
                                      cansend=true;
                                      canmaxpr=true;
                                    }

                                  }
                                  if(userdet1?.arpm!=null){
                                    int arpm2= int.parse(userdet1!.arpm.toString()) ;
                                    if(arpm2<50){
                                      cansend=true;
                                      canarpm=true;
                                    }

                                  }

                                }
                                if(cansend==true&&canpdsr==true&&canmaxpr==true) {
                                  setState(() {
                                    reqst = '1';
                                  });
                                  Navigator.of(context).pop();
                                  personSwiped(uid1, uid, false);
                                }
                                else{
                                  if(canpdsr==false){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return   AlertDialog(
                                            title: Text('Notification'),
                                            content: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                              ],
                                            ),
                                            actions: [
                                              Text('Your per day sending requests are over.Please upgrade or buy a package!')
                                              ,
                                              SizedBox(height: 20,),
                                              RoundedButton(
                                                onPressed: () {
                                                  Navigator
                                                      .of(context)
                                                      .push(new MaterialPageRoute(builder: (BuildContext context) => pkg()));
                                                },
                                                text: 'Upgrade',
                                              ),
                                              RoundedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                text: 'Cancel',
                                              ),
                                            ],
                                          );
                                        });

                                  }
                                  if(canmaxpr==false){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return   AlertDialog(
                                            title: Text('Notification'),
                                            content: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                              ],
                                            ),
                                            actions: [
                                              Text('Your maximum pending requests are over. Please upgrade or buy a package!')
                                              ,
                                              SizedBox(height: 20,),
                                              RoundedButton(
                                                onPressed: () {
                                                  Navigator
                                                      .of(context)
                                                      .push(new MaterialPageRoute(builder: (BuildContext context) => pkg()));
                                                },
                                                text: 'Upgrade',
                                              ),
                                              RoundedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                text: 'Cancel',
                                              ),

                                            ],
                                          );
                                        });

                                  }
                                  // if(canarpm==false){
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (BuildContext context) {
                                  //         return   AlertDialog(
                                  //           title: Text('Notification'),
                                  //           content: Row(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //             ],
                                  //           ),
                                  //           actions: [
                                  //             Text('Your accepted requests count sent by you within a month of period are over. Please upgrade or buy a package!')
                                  //             ,
                                  //             SizedBox(height: 20,),
                                  //             RoundedButton(
                                  //               onPressed: () {
                                  //                 Navigator.of(context).pop();
                                  //               },
                                  //               text: 'Upgrade',
                                  //             ),
                                  //             RoundedButton(
                                  //               onPressed: () {
                                  //                 Navigator.of(context).pop();
                                  //               },
                                  //               text: 'Cancel',
                                  //             ),
                                  //
                                  //           ],
                                  //         );
                                  //       });
                                  //
                                  // }
                                }

                              },
                              text: 'Confirm',
                            ),  RoundedOutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Cancel',
                            ),
                          ],
                        );
                      });

                }else{
                  setState(() {
                    reqst='0';
                  });

                  personrem(uid1,uid,false);
                }


              }, imageAsset: 'assets/images/love.png',
            ),
            SizedBox(width: 20,),
            new RoundIconButton.small(
              icon: Icons.settings,
              bColor:Colors.white ,
              iconColor: Colors.blue,
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                if(userdet1?.req=="Accepted") {
                  sendMessagePressed(context);
                }
                else{
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return   AlertDialog(
                          title: Text('Notification'),
                          content: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            ],
                          ),
                          actions: [
                            Text('Can\'t chat with user before accepting  Request')
                          ,
                            SizedBox(height: 20,),
                            RoundedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'OK',
                            ),

                          ],
                        );
                      });
                }

              }, imageAsset: 'assets/images/ic_chat.png',
            ),
            SizedBox(width: 20,),

            new RoundIconButton.small(
              icon: Icons.bookmark,
              bColor:bkt!= '1' ? Colors.white : Colors.blue,
              iconColor: Colors.green,
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                if(bkt=='0') {
                  setState(() {
                    bkt = '1';
                  });
                  personbooked(uid1, uid, true);
                }else{
                  setState(() {
                    bkt = '0';
                  });
                  rembook(uid1,uid,false);
                }

              }, imageAsset: 'assets/images/bookmark.png',
            ),
            SizedBox(width: 20,),
            new RoundIconButton.small(
              icon: Icons.block,
              iconColor: Colors.orange,
              bColor:blk!= '1' ? Colors.white : Colors.blue,
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return    AlertDialog(
                  title: Text("Reort or Block Profile"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Report or block this user for possible violations")
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          blk = '1';
                        });
                        personblock(uid1,uid);
                        Navigator.of(context).pop();
                      },
                       child: Text('Block'),
                    ),  OutlinedButton(
                      onPressed: () {
                        _displayTextInputDialog(context);
                      }, child: Text('Report'),

                    ), OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, child: Text('Cancel'),

                        ),
                     ], ), ],
                );
    });



              }, imageAsset: 'assets/images/block.png',
            ),

            // new SizedBox(
            //   height: 10.0,
            // ),
            // new Text(
            //   "Chat",
            //   style: TextStyle(color: Colors.grey, fontSize: 12.0),
            // )
          ],
        ),
        // new Column(
        //   children: <Widget>[
        //     new RoundIconButton.large(
        //       icon: Icons.camera_alt,
        //       iconColor: Colors.blue,
        //       onPressed: () {
        //         Navigator.of(context)
        //             .push(MaterialPageRoute (
        //           builder: (BuildContext context) =>  galview(),
        //         ),);
        //       }, imageAsset: 'assets/images/gallry.png',
        //     ),
        //     new SizedBox(
        //       height: 10.0,
        //     ),
        //     new Text(
        //       "MEDIA",
        //       style: TextStyle(color: Colors.grey, fontSize: 12.0),
        //     )
        //   ],
        // ),
        // new Column(
        //   children: <Widget>[
        //     new RoundIconButton.large(
        //       icon: Icons.edit,
        //       iconColor: Colors.green,
        //       onPressed: () {
        //         Navigator.of(context)
        //             .push(MaterialPageRoute (
        //           builder: (BuildContext context) =>  EditProfilePage(),
        //         ),);
        //       }, imageAsset: 'assets/images/resume.png',
        //     ),
        //     new SizedBox(
        //       height: 10.0,
        //     ),
        //     new Text(
        //       "EDIT INFO",
        //       style: TextStyle(color: Colors.grey, fontSize: 12.0),
        //     )
        //   ],
        // ),
      ],
    );
  }

  Future<String?> gett2(BuildContext c) async {

    //final arguments = ModalRoute.of(c)!.settings.arguments as Map;

    if (widget.uidnew != null){
      uid=widget.uidnew;
    }
     uid1= (await SharedPreferencesUtil.getUserId());
     SharedPreferences shared_User = await SharedPreferences.getInstance();
     user= parsePhotos(shared_User.getString('user')).first;
    return widget.uidnew;
  }
  Future<userdet?> gett(String? mid) async {

      await _userProvider!
        .getUserdet2(mid!,uid1!)
        .then((response) {
        userdet1=response;
      return response;
    });

      return userdet1;
  }
  Future<void> sendMessage(String myUserId,String? oUserId,String chatid,) async {


    Message message = Message(DateTime.now().millisecondsSinceEpoch, false,
        myUserId, "Hi, I am interested in your profile.Would you like to Chat with me?",chatid);

    await _userProvider!
        .addMessage(chatid,message)
        .then((response) {


    });


  }



  void sendMessagePressed(BuildContext context) async {
    // AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;
    await _userProvider!
        .sendmsg( userdet1!.uid,'You  have a new message!')
        .then((response) {
      if(response!=null){
        // _isLoading = false;

      }
    });
    var uid= (await SharedPreferencesUtil.getUserId());
    if(uid!=null) {
      await _userProvider!
          .addchat(compareAndCombineIds(uid, userdet1!.uid),uid,userdet1!.uid)
          .then((response) {
        if(response!=null){

          //  _isLoading = false;
        }
      });
      sendMessage(uid,userdet1!.uid,compareAndCombineIds(uid, userdet1!.uid));
      Navigator.pop(context);
      Navigator.pushNamed(context, ChatScreen.id, arguments: {
        "chat_id": compareAndCombineIds(uid, userdet1!.uid),
        "user_id": uid,
        "other_user_id":userdet1!.uid
      });
    }
  }
  // void personSwiped(String? myUser, String? otherUser, bool isLiked) async {
  //   //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
  //   if (myUser!=null&&otherUser!=null) {
  //     _isLoading = true;
  //     await _userProvider!
  //         .insertswip(myUser,otherUser,isLiked.toString())
  //         .then((response) {
  //       if(response!=null){
  //         // _isLoading = false;
  //         showSnackBar(context, 'Requested!');
  //       }
  //     });
  //
  //
  //
  //
  //
  //     }
  //   else{
  //     showSnackBar(context, 'failed!');
  //
  //   }
  //   _isLoading = false;
  //   // setState(() {});  //remove1
  // }

  void personblock(String? myUser,  String? otherUser) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .insertblock(myUser, otherUser)
          .then((response) {
        if (response != null) {
          // _isLoading = false;
        //  setState(() {

            remid=otherUser;
          planets.removeWhere((item) => item.id == otherUser);
          widget.notifyParent1();
        //  });

        }
      });
    }

  }
///////////////////////////////////////////////
  void rembook(String? myUser,  String? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .rembk(myUser,otherUser,isLiked.toString())
          .then((response) {
        if(response!=null){
          // _isLoading = false;
          showSnackBar(context, 'Bookmark Removed!');
        }
      });

    }}
////////////////////////////////////////////////
  void personrem(String? myUser,  String? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .remswip(myUser,otherUser,isLiked.toString())
          .then((response) {
        if(response!=null){
          // _isLoading = false;
          showSnackBar(context, 'Request Removed!');
        }
      });

    }}
/////////////////////////////////////////////////
  void personSwiped(String? myUser,  String? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .insertswip(myUser,otherUser,isLiked.toString())
          .then((response) {
        if(response!=null){
          // _isLoading = false;

        }
      });
      await _userProvider!.getuserlist2(myUser).then((response) {
        planetsrq = response;


      });
      //  _isLoading = false;
      _ignoreSwipeIds.add(otherUser);

      if (isLiked == true) {
        await _userProvider!
            .sendmsg(otherUser,'User has sent you a request!')
            .then((response) {
          if(response!=null){
            // _isLoading = false;

          }
        });

        if (await isMatch(myUser, otherUser) == true) {
          //  _databaseSource.addMatch(myUser.id, Match(otherUser.id));

          await _userProvider!
              .insertmatch(myUser,otherUser)
              .then((response) {
            if(response!=null){
              //  _isLoading = false;

            }
          });
          await _userProvider!
              .sendmsg(otherUser,'You  have a new match!')
              .then((response) {
            if(response!=null){
              // _isLoading = false;

            }
          });

          await _userProvider!
              .insertmatch(otherUser,myUser)
              .then((response) {
            if(response!=null){

              //  _isLoading = false;
            }
          });
          // _databaseSource.addMatch(otherUser.id, Match(myUser.id));
          String chatId = compareAndCombineIds(myUser, otherUser);
          //  _databaseSource.addChat(Chat(chatId, null));
          await _userProvider!
              .addchat(chatId,myUser,otherUser)
              .then((response) {
            if(response!=null){

              //  _isLoading = false;
            }
          });



          Navigator
              .of(context)
              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  MatchedScreen(otherUserProfilePhotoPath: imgpath+userdet1!.photo.toString(), otherUserId: otherUser, myUserId: myUser, myProfilePhotoPath: user?.profilePhotoPath??'',),));


        }
        else{

        }

      }
      else {
        // _isLoading = false;
        // appUser=  loadPerson(user.id);


      }}
    else{
      showSnackBar(context, 'failed!');

    }
    _isLoading = false;
    showSnackBar(context, 'Requested!');
    // setState(() {});  //remove1
  }

  Future<bool> isMatch(String? myUser,  String? otherUser) async {
    // DocumentSnapshot swipeSnapshot =
    //     await _databaseSource.getSwipe(otherUser.id, myUser.id);
    bool er=false;
    _isLoading = true;
    // swip swipe = Swipe.fromSnapshot(swipeSnapshot);
    await _userProvider!
        .getswipid(otherUser, myUser)
        .then((response) {
      if(response==null){

        //showSnackBar(context, 'failed!');
        er=false;
        return er;
        _isLoading = false;
      }
      else{
        final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
        List<swip> swipes =parsed.map<swip>((json) => swip.fromJson(json)).toList();
        //var swipes =response;
        if(swipes.length>0) {
          if (swipes.first.liked == "1") {
            //_isLoading = false;
            er=true;
            return er;
          }
          else{
            // _isLoading = false;

            er=false;
            return er;

          }}
      }
    });
    _isLoading = false;

    return er;




  }




  void personbooked(String? myUser, String? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .insertbook(myUser,otherUser,isLiked.toString())
          .then((response) async {
        if(response!=null){
          // _isLoading = false;

          showSnackBar(context, 'Bookmark Added!');
        }
      });

      //  _isLoading = false;
      //_ignoreSwipeIds.add(otherUser.id);

    }
    else{
      showSnackBar(context, 'failed!');

    }
    _isLoading = false;
    // setState(() {});  //remove1
  }


  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }


  @override
  Widget build(BuildContext context) {

   return myw();
  }
Widget myw(){

  if(userdet1!=null){
    return Scaffold(

      body:
      DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,

        ),
        child:
        Padding(
          padding: kDefaultPadding,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: Text('Account Details',style: TextStyle(color: Colors.black),),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.pop(context);
                //   Navigator
                //       .of(context)
                //       .push(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen()));

                },
              ),
              actions: [
                // IconButton(
                //   icon: Icon(
                //     Icons.settings,
                //     color: Colors.green,
                //   ),
                //   onPressed: () {
                //     //Navigator.pop(context);
                //
                //   },
                // ),
              ],
            ),
            body:

            SingleChildScrollView(
            scrollDirection:  Axis.vertical,
           // color: Colors.white,
            child:

            Column(
              children: <Widget>[
                // construct the profile details widget here
                // SizedBox(height: 10),
                // Text(
                //   "User Profile",
                //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                Center(
                  child: Stack(
                    children: [

                      Container(
                        width: 330,
                        height: 330,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(userdet1!=null?imgpath+userdet1!.photo.toString():""
                                ))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                        GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context, new MaterialPageRoute(builder: (context) => viewphoto(uidnew: userdet1?.uid??'')))


                          ,
                          child:
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.redAccent,
                            ),
                            child: Icon(
                              Icons.photo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                _buildSettingsButtons(),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "User Info",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),

              rdit(   buildAccountOptionRow(context,'First Name',userdet1?.firstName??''),),


               SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Last Name',userdet1?.lastName??''),
                SizedBox(
                  height: 2,
                ),
          rdit( buildAccountOptionRow(context,'Date of Birth','${dateTime1?.year??''}-${dateTime1?.month??''}-${dateTime1?.day??''}'),),
                SizedBox(
                  height: 2,
                ),


                buildAccountOptionRow(context,'Gender',gen),
                SizedBox(
                  height: 2,
                ),
          rdit( buildAccountOptionRow(context,'Religion',userdet1?.religion??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Highest Qualification',userdet1?.degree??''),
                SizedBox(
                  height: 2,
                ),
                // buildAccountOptionRow(context,'Works At',userdet1?.company??''),
                // SizedBox(
                //   height: 2,
                // ),
          rdit(      buildAccountOptionRow(context,'Occupation',userdet1?.designation??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Monthly Income','${userdet1?.income}${userdet1?.curr}'),
                SizedBox(
                  height: 2,
                ),
          rdit(      buildAccountOptionRow(context,'Marital Status',userdet1?.marital??''),),

                SizedBox(
                  height: 2,
                ),
           buildAccountOptionRow(context,'Country',userdet1?.country??''),
                SizedBox(
                  height: 2,
                ),
                rdit(  buildAccountOptionRow(context,'State',userdet1?.state??''),),
                SizedBox(
                  height: 2,
                ),
                 buildAccountOptionRow(context,'Height',userdet1?.height??''),
                SizedBox(
                  height: 2,
                ),
          rdit(        buildAccountOptionRow(context,'Weight',userdet1?.weight??''),),
                SizedBox(
                  height: 2,
                ),
                    buildAccountOptionRow(context,'Brothers',userdet1?.br??''),
                SizedBox(
                  height: 2,
                ),
                rdit(         buildAccountOptionRow(context,'Sisters',userdet1?.sis??''),),
                SizedBox(
                  height: 2,
                ),
                    buildAccountOptionRow(context,'Use of Drinks',userdet1?.dk??''),
                SizedBox(
                  height: 2,
                ),
                rdit(      buildAccountOptionRow(context,'Use of Smoke',userdet1?.sk??''),),
                SizedBox(
                  height: 2,
                ),
                      buildAccountOptionRow(context,'Known Languages',userdet1?.lans??''),
                SizedBox(
                  height: 2,
                ),
                rdit(   buildAccountOptionRow(context,'Bio',userdet1?.introduction??''),),
                SizedBox(
                  height: 2,
                ),
           buildAccountOptionRow(context,'Phone','Hidden'),
                //userdet1?.phone??
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Partner Preferences",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
          rdit(  buildAccountOptionRow(context,'Religion should be',userdet1?.prefrel??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Education should be',userdet1?.prefedu??''),
                SizedBox(
                  height: 2,
                ),
          rdit(  buildAccountOptionRow(context,'Job should be',userdet1?.profession??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Income should be',userdet1?.prefincome??''),
                SizedBox(
                  height: 2,
                ),
          rdit(   buildAccountOptionRow(context,'Marital Status should be',userdet1?.prefms??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Drinking should be',userdet1?.dkp??''),
                SizedBox(
                  height: 2,
                ),
          rdit( buildAccountOptionRow(context,'Smoking should be',userdet1?.skp??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Language should be',userdet1?.lansp??''),
                SizedBox(
                  height: 2,
                ),
          rdit(      buildAccountOptionRow(context,'Country should be',userdet1?.prefcntry??''),),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'State should be',userdet1?.prefst??''),
                SizedBox(
                  height: 2,
                ),
          rdit(    buildAccountOptionRow(context,'Age should be',int.parse(userdet1?.agemin??0.toString()).round().toString()+' to '+int.parse(userdet1!.agemax??0.toString()).round().toString()),),




              ],
            ),
             ),
          ),
        ),
      ),
    );
  }
  else{
    return CustomModalProgressHUD(
      inAsyncCall: true,
      child:
      Scaffold(

        body:
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,

          ),
          child:
          Padding(
            padding: kDefaultPadding,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.settings,
                  //     color: Colors.green,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //
                  //   },
                  // ),
                ],
              ),
              body:

              Container(

                // color: Colors.white,
                // child: Column(children:[Padding(padding: EdgeInsets.only(top: 20.0,bottom:350.0,left: 500.0 )),CircularProgressIndicator(
                //   backgroundColor: Colors.white,
                //   strokeWidth: 1,
                // ),] ),


              ),
            ),
          ),
        ),
      ),
    );}




}
Widget ageselect(){
  return RangeSlider(
    values: _currentRangeValues,
    min: 16,
    max: 60,
    divisions: 54,
    labels: RangeLabels(
      _currentRangeValues.start.round().toString(),
      _currentRangeValues.end.round().toString(),
    ),
    onChanged: (RangeValues values) {
      setState(() {
        _currentRangeValues = values;

      });
    },
  );
}



Widget rdit( Widget rt){
    return
      Container(
        height: 35,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 0,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          color: Color.fromRGBO(242, 231, 237, 0.6),
        ),
        child:  rt,

      );


}

  Widget buildAccountOptionRow(BuildContext context, String title,String? body) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
            ),
            Text(
              body!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        );

  }

  GestureDetector buildAccountOptionRow2(BuildContext context, String title) {
    return GestureDetector(
      onTap: ()
      {
       sendmail(userdet1?.id??'', title,userdet1?.email??'');
       showAlertDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report User'),

            actions: <Widget>[
              buildAccountOptionRow2(context,'Misleading or Scam'),
              buildAccountOptionRow2(context,'Sexually inappropriate'),
              buildAccountOptionRow2(context,'Offencive'),
              buildAccountOptionRow2(context,'Violence'),
              buildAccountOptionRow2(context,'User pretending to be someone else'),
              buildAccountOptionRow2(context,'Prohibited content'),
              buildAccountOptionRow2(context,'Spam'),
              buildAccountOptionRow2(context,'False information'),
              buildAccountOptionRow2(context,'Political candidate or issue'),
              buildAccountOptionRow2(context,'Other'),

            ],
          );
        });
  }

  Future<void> sendmail(String em,String em1,String em2) async {
    String userName = 'info@tunelk.com';
    String password = 'Tunelk@123';


    String smtpServerHost = 'tunelk.com';
    int smtpServerPort = 465;
    bool isSmtpServerSecure = true;



    final client = SmtpClient(smtpServerHost, isLogEnabled: true);
    try {
      await client.connectToServer(smtpServerHost, smtpServerPort,
          isSecure: isSmtpServerSecure);
      await client.ehlo();
      await client.authenticate(userName, password,AuthMechanism.login);
      final builder = MessageBuilder.prepareMultipartAlternativeMessage();
      builder.from = [MailAddress('Tune Solutions', userName)];
      builder.to = [MailAddress(userName,userName)];
      builder.subject = 'Tune Alert';
      // builder.addTextPlain('hello world.');
      builder.addTextHtml('<p><b>User has reported that possible violation by user</b></p><p><b>'+em1+'</b></p>User id:'+em+' Email:'+em2);

      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      print('message sent: ${sendResponse.isOkStatus}');
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
    }
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.of(context, rootNavigator: true).pop('SettingsTab');
        NavigatorState  nav = Navigator.of(context);
        nav.pop();
        nav.pop();nav.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Thank you'),
      content: Text("Your Report Submitted."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
enum HeightUnit { ft, cm }