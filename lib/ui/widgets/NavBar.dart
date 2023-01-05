import 'dart:io';

import 'package:cygnus/Application.dart';
import 'package:cygnus/ui/screens/NetflixSubscription.dart';
import 'package:cygnus/ui/screens/blocksreen.dart';
import 'package:cygnus/ui/screens/home.dart';
import 'package:cygnus/ui/screens/setings/validation.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsPage.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/galview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/planets.dart';
import '../../generated/l10n.dart';
import '../../util/LanguageChangeProvider.dart';
import '../../util/shared_preferences_utils.dart';
import '../contactus.dart';
import '../pkg.dart';
import '../screens/fav.dart';
import '../screens/setings/aboutus.dart';
import '../screens/start_screen.dart';
import 'bordered_text_field.dart';
import 'round_icon_button.dart';
import 'rounded_outlined_button.dart';

class NavBar extends StatelessWidget {
  bool _isLoading = false;
  bool checkedValue = false;

  List<bool> _isChecked = [false];
  bool canUpload = false;
  String rel="Religion";
  String marit="Marriage Status";
  String age="Age";
  String dist="District";
  String? uid ;
  LanguageChangeProvider? appLanguage;
  List<String> _texts = [
    "Show Foreign Profiles Only",

  ];
  Future<String?> gett2(BuildContext context) async {
    uid=(await SharedPreferencesUtil.getUserId());
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
  }



  @override
  Widget build(BuildContext context) {
    gett2(context);
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(currentAccountPictureSize:Size( 130, 130),
            accountName: Text('Tunelk.com',style: TextStyle(color: Colors.black),),
            accountEmail: Text('info@tunelk.com',style: TextStyle(color: Colors.black),),
            currentAccountPicture:
            Image(image:AssetImage('assets/images/tinder_icon.png'),width: 700,height: 700,),

            decoration: new BoxDecoration(
              color:Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              // boxShadow: <BoxShadow>[
              //   new BoxShadow(
              //     color: Colors.black12,
              //     blurRadius: 10.0,
              //     offset: new Offset(0.0, 10.0),
              //   ),
              // ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Bookmarks'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(3,0,0))),
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Filter Proposals'),
            onTap: () => {
              Navigator
                  .of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(1,1,0))),},



          ),

          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Requested'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(3,0,1))),
            },
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account_sharp),
            title: Text('Matched'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(3,0,2))),
            },
          ),
          ListTile(
            leading: Icon(Icons.call_received),
            title: Text('Received'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(3,0,3))),
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(2,0,0))),},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () => {Navigator
                .of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(0,0,0))),},
          ),
          ListTile(
            leading: Icon(Icons.verified),
            title: Text('Account Verification'),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => validation())),},
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Partner Preferences'),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => EditProfilePage(1, "Partner Preferences"))),},
          ),
          ListTile(
            leading: Icon(Icons.photo_outlined),
            title: Text(S.of(context).homeHeaderGallery),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => galview())),},
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Packages'),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => pkg())),},
          ),
          ListTile(
            leading: Icon(Icons.add_link),
            title: Text('Social Media'),
            onTap: () => {

              showDialog(
                //barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {

                  return AlertDialog(
                    title: Text('Social Media'),
                    content: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              RoundIconButton.small(
                                icon: Icons.settings,
                                iconColor: Colors.redAccent,
                                onPressed: () {

                                  launchUrl3();
                                }, imageAsset: 'assets/images/tune512.png',
                              ),SizedBox(width: 10,),  TextButton(
                                  onPressed: () {
                                    launchUrl3();
                                  },
                                  child: Text("Tune")),
                            ]  ),
                        SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                      children: [
                        RoundIconButton.small(
                          icon: Icons.settings,
                          iconColor: Colors.blue,
                          onPressed: () {

                            launchUrl2();
                          }, imageAsset: 'assets/images/fb.png',
                        ),SizedBox(width: 10,),  TextButton(
                      onPressed: () {
                        launchUrl2();
                      },
                      child: Text("Facebook")),
                    ]  ),
                        SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              RoundIconButton.small(
                                icon: Icons.camera_alt,
                                iconColor: Colors.blue,
                                onPressed: () {
                                  launchUrl1();
                                }, imageAsset: 'assets/images/tw.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                                  onPressed: () {
                                    launchUrl1();
                                  },
                                  child: Text("Twitter")),
                            ]  ),SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              new RoundIconButton.small(
                                icon: Icons.edit,
                                iconColor: Colors.red,
                                onPressed: () {
                                  _launchURL();
                                }, imageAsset: 'assets/images/youtube.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                      onPressed: () {
                        _launchURL();
                      },
                      child: Text("Youtube")),
                            ]  ),
                        SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              new RoundIconButton.small(
                                icon: Icons.edit,
                                iconColor: Colors.redAccent,
                                onPressed: () {
                                  _launchURLinsta();
                                }, imageAsset: 'assets/images/insta.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                                  onPressed: () {
                                    _launchURLinsta();
                                  },
                                  child: Text("Instagram")),
                            ]  ),
                        SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              new RoundIconButton.small(
                                icon: Icons.edit,
                                iconColor: Colors.green,
                                onPressed: () {
                                  _launchURLwhats();
                                }, imageAsset: 'assets/images/whatsapp.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                                  onPressed: () {
                                    _launchURLwhats();
                                  },
                                  child: Text("Whatsapp")),
                            ]  ),SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              new RoundIconButton.small(
                                icon: Icons.edit,
                                iconColor: Colors.blue,
                                onPressed: () {
                                  _launchURLtelegram();
                                }, imageAsset: 'assets/images/telegram.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                                  onPressed: () {
                                    _launchURLtelegram();
                                  },
                                  child: Text("Telegram")),
                            ]  ),SizedBox(height: 10,),
                        Row( mainAxisSize: MainAxisSize.min,
                            children: [
                              new RoundIconButton.small(
                                icon: Icons.edit,
                                iconColor: Colors.blue,
                                onPressed: () {
                                  _launchURLtik();
                                }, imageAsset: 'assets/images/tiktok.png',
                              ),

                              SizedBox(width: 10,),TextButton(
                                  onPressed: () {
                                    _launchURLtik();
                                  },
                                  child: Text("Tiktok")),
                            ]  ),
                      ],
                    ),
                    actions: [


                    ],
                  );

                },
              ),


            },
          ),


         // _buildSettingsButtons(),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(S.of(context).settingsTitle,),
            onTap: () => {    Navigator.pushNamed(context, SettingsPage.id,arguments: {"name" :
           uid}),
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () => {Navigator
        .of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) => contactus())),
  },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => contactus())),
            },
          ),
          ListTile(
            leading: Icon(Icons.compare),
            title: Text('About Us'),
            onTap: () => {Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => aboutus())),
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () => {

    showDialog(
    //barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {

           return AlertDialog(
            title: Text('Languages'),
            content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

            ],
            ),
            actions: [
            TextButton(
            onPressed: () {
            Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("en");
            Navigator.of(context).pop();
            },
            child: Text("English")),
            TextButton(
            onPressed: () {
              Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("si");
            Navigator.of(context).pop();
            },
            child: Text("සිංහල")),
              TextButton(
                  onPressed: () {
                    Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("hi");
                    Navigator.of(context).pop();
                  },
                  child: Text("हिंदी")),TextButton(
                  onPressed: () {
                    Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("ta");
                    Navigator.of(context).pop();
                  },
                  child: Text("தமிழ்")),
            ],
            );

    },
    ),


            },
          ),ListTile(
            leading: Icon(Icons.block),
            title: Text('Blocked Users'),
            onTap: () => {
              Navigator
                  .of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) => blockscreen())),
            },
          ),

          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Privacy Policy'),
            onTap: () => {
              launchpp(),
            },
          ),  ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Terms and Conditions'),
            onTap: () => {
              launchtc(),
            },
          ),

          ListTile(
            leading: Icon(Icons.star_rate),
            title: Text('Rate Us'),
            onTap: () => {
              launchps(),
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {
              logoutPressed(context),
            },
          ),

        ],
      ),
    );
  }
  void logoutPressed1( BuildContext context) async {
    await SharedPreferencesUtil.removeUserId();

    Navigator.pop(context);
    Navigator.pushNamed(context, StartScreen.id);
  }
  Future<UserCredential?> logoutFacebook() async {

    await FacebookAuth.instance.logOut();
    return null;
  }
  Future<void> gsignOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = new GoogleSignIn();

    await _firebaseAuth.signOut();
    await  googleSignIn.signOut();
  }

  void logoutPressed (BuildContext context){

    logoutPressed1(context);
    logoutFacebook();
    gsignOut();
  }

  void launchUrl2() async{
    var url = 'fb://facewebmodal/f?href=https://www.facebook.com/Tune-Solutions-112175854814781/';
    if (await canLaunch(url)) {
      await launch( url, universalLinksOnly: true, );
    } else { throw 'There was a problem to open the url: $url'; }

  }
  void launchUrl1() async{

    var url = 'https://twitter.com/SolutionsTune';
    if (await canLaunch(url)) {
      await launch( url, universalLinksOnly: true, );
    } else { throw 'There was a problem to open the url: $url'; }

  }
  void launchUrl3() async{

    var url = 'https://tunelk.com';
    if (await canLaunch(url)) {
      await launch( url, universalLinksOnly: true, );
    } else { throw 'There was a problem to open the url: $url'; }

  }
  var appPackageName="com.icw.cygnus.cygnus";
  void launchps(){
    try {
      if (Platform.isIOS) {
        launch("https://apps.apple.com/us/app/tune-matrimony/id1611541773");
      }
      else{
        launch("market://details?id=" + appPackageName);
      }

    } on PlatformException catch(e) {
      launch("https://apps.apple.com/us/app/tune-matrimony/id1611541773");
    } finally {
      launch("https://apps.apple.com/us/app/tune-matrimony/id1611541773");
    }

  }
  void launchpp(){
    try {
      if (Platform.isIOS) {
        launch("https://tunelk.com/privacy-policy");
      }
      else{
        launch("https://tunelk.com/privacy-policy" );
      }

    } on PlatformException catch(e) {
      launch("https://tunelk.com/privacy-policy");
    } finally {
      launch("https://tunelk.com/privacy-policy");
    }

  }
  void launchtc(){
    try {
      if (Platform.isIOS) {
        launch("https://tunelk.com/terms-conditions");
      }
      else{
        launch("https://tunelk.com/terms-conditions");
      }

    } on PlatformException catch(e) {
      launch("https://tunelk.com/terms-conditions");
    } finally {
      launch("https://tunelk.com/terms-conditions");
    }

  }
  _launchURL() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'youtube://www.youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg')) {
        await launch(
            'youtube://www.youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://www.youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg')) {
          await launch(
              'https://www.youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg');
        } else {
          throw 'Could not launch www.youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg';
        }
      }
    } else {
      const url = 'https://youtube.com/channel/UCvRhNw2Ia4BqMyR5lstMPHg';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  _launchURLinsta() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'instagram://https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255')) {
        await launch(
            'instagram://https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255')) {
          await launch(
              'https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255');
        } else {
          throw 'Could not launch https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255';
        }
      }
    } else {
      const url = 'https://www.instagram.com/invites/contact/?i=12lcji52qloi2&utm_content=ohfa255';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  _launchURLtelegram() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'instagram://https://t.me/Tune_Solutions')) {
        await launch(
            'instagram://https://t.me/Tune_Solutions',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://t.me/Tune_Solutions')) {
          await launch(
              'https://t.me/Tune_Solutions');
        } else {
          throw 'Could not launch https://t.me/Tune_Solutions';
        }
      }
    } else {
      const url = 'https://t.me/Tune_Solutions';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  _launchURLtik() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'tiktok://https://vt.tiktok.com/ZSd5ehoN5/')) {
        await launch(
            'titok://https://vt.tiktok.com/ZSd5ehoN5/',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://vt.tiktok.com/ZSd5ehoN5/')) {
          await launch(
              'https://vt.tiktok.com/ZSd5ehoN5/');
        } else {
          throw 'Could not launch https://vt.tiktok.com/ZSd5ehoN5/';
        }
      }
    } else {
      const url = 'https://vt.tiktok.com/ZSd5ehoN5/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  _launchURLwhats() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'whatsapp://https://wa.me/94768725021')) {
        await launch(
            'whatsapp://https://wa.me/94768725021',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://wa.me/94768725021')) {
          await launch(
              'https://wa.me/94768725021');
        } else {
          throw 'Could not launch https://wa.me/message/P3YKZ5TR7WKQI1';
        }
      }
    } else {
      const url = 'https://wa.me/94768725021';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  _launchCaller() async {
    const url = "tel:1234567";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new RoundIconButton.small(
              icon: Icons.settings,
              iconColor: Colors.blue,
              onPressed: () {

                launchUrl2();
              }, imageAsset: 'assets/images/fb.png',
            ),
            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "Facebook",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.small(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                launchUrl1();
              }, imageAsset: 'assets/images/tw.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "Twitter",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.small(
              icon: Icons.edit,
              iconColor: Colors.red,
              onPressed: () {
                _launchURL();
              }, imageAsset: 'assets/images/youtube.png',
            ),
            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "Youtube",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
      ],
    );
  }
}