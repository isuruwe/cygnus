import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/setings/aboutus.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'package:cygnus/ui/widgets/input_dialog.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/ui/widgets/round_icon_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../contactus.dart';
import '../../pkg.dart';
import '../fullscreen.dart';
import '../start_screen.dart';
import 'SettingsPage.dart';
import 'galview.dart';

class SettingsTab extends StatefulWidget {
  static const String id = 'SettingsTab';
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab>
    with AutomaticKeepAliveClientMixin<SettingsTab> {

  int currentPage = 0;
  int currentColor = 0;
  bool reverse = false;
  PageController _controller = new PageController();
  late Timer _pageChangeTimer;
  late Timer colorTimer;
AppUser? user;
  UserProvider? userProvider;
  @override
  void initState()  {
    // TODO: implement initState

    super.initState();

    gett().then((data) {
      setState(() {
        this.user = data;
      });
    });
    _pageChanger();
  }
Future<AppUser?> gett() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
 user= parsePhotos(shared_User.getString('user')).first;
 return user;
}

  Future<void> gsignOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = new GoogleSignIn();

    await _firebaseAuth.signOut();
    await  googleSignIn.signOut();
  }
void logoutPressed (){

  logoutPressed1(context);
  logoutFacebook();
  gsignOut();
  }
  List<AppUser> parsePhotos(String? responseBody) {
    List<AppUser> rty=[AppUser(profilePhotoPath: '')];
    if(responseBody!=null) {
      final   parsed  = jsonDecode(responseBody).cast<
          Map<String, dynamic>>();
      return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
    }else{
      return rty;

    }

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
  @override
  void dispose() {
    _pageChangeTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _pageChanger() {
    _pageChangeTimer = Timer.periodic(Duration(seconds: 2), (_) {
      if (reverse == false && currentPage < hookUpPlusList.length - 1) {
        _controller.nextPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeIn);
      } else if (reverse == true && currentPage <= hookUpPlusList.length - 1) {
        _controller.previousPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeOut);
      }
    });
  }

  void _onPageChanged(int value) {
    //print("$value $reverse");
    setState(() {
      currentPage = value;
    });

    if (currentPage == hookUpPlusList.length - 1) {
      setState(() {
        reverse = true;
      });
      return;
    }

    if (currentPage == 0) {
      setState(() {
        reverse = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
   if( user!=null) {
     return DecoratedBox(
       decoration: const BoxDecoration(
         color: kColorPrimaryVariant,

       ),
       child: Center(child:  Scaffold(
         body:
    SingleChildScrollView(child:
          Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children:

             <Widget>[_buildProfileInfo(), _buildSettingsBottom()]





         ),),
       ),
       ),
     );

    }else{
     return DecoratedBox(
       decoration: const BoxDecoration(
         color: kColorPrimaryVariant,

       ),
       child: Center(child:  Scaffold(
         body: new Stack(
             children:

             <Widget>[Container(child: Text('Error!'),) ,_buildSettingsBottom()]





         ),
       ),
       ),
     );

   }

  }

  Widget _buildProfileInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.only(
          right: 15.0, left: 15.0, top: 20.0, bottom: 50.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 1.0)
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(250, 100),
            bottomRight: Radius.elliptical(250, 100),
          )),
      child:new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
         child:user!.profilePhotoPath.isNotEmpty ? GestureDetector(
      child: Hero(
        tag: 'imageHero',
        child: CachedNetworkImage(
          imageUrl: user!.profilePhotoPath,
          imageBuilder: (context, imageProvider) => Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return  fullscreen();
        }));
      },
    ) :Container(),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            user!.name?? '',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            user!.bio??'',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          new SizedBox(
            height: 20.0,
          ),
          _buildSettingsButtons(),
          new SizedBox(
            height: 20.0,
          ),
          _buildSettingsButtons2(),
        ],
      ),
    );
  }

  Widget _buildSettingsBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Flexible(child: _buildHookUpPlusUI()),
          new Padding(
            padding:
            const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 45.0),
            child: new ElevatedButton(

              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55.0)),
                ),


              onPressed: () {
                Future.delayed(Duration.zero, () {
                  logoutPressed();
                });


              },
              child: Center(
                child: new Text(
                  "LOGOUT",
                  style: TextStyle(color: Colors.pink, fontSize: 16.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHookUpPlusUI() {
    return Container(
      height: 150.0,
      child: PageIndicatorContainer(

          indicatorSpace: 5.0,
          indicatorSelectorColor: Colors.blue,
          indicatorColor: Colors.grey.withOpacity(0.5),
          align: IndicatorAlign.bottom,
          child: new PageView.builder(
              controller: _controller,
              onPageChanged: _onPageChanged,
              itemCount: hookUpPlusList.length,
              itemBuilder: (c, index) {
                return new Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hookUpPlusList[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        hookUpPlusList[index].subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                );
              }),
          length: hookUpPlusList.length),
    );
  }

  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.settings,
              iconColor: Colors.red,
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                Navigator.pushNamed(context, SettingsPage.id,arguments: {"name" :
                user!.id});

              }, imageAsset: 'assets/images/settings.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "SETTINGS",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute (
                  builder: (BuildContext context) =>  galview(),
                ),);
              }, imageAsset: 'assets/images/gallry.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "MEDIA",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.edit,
              iconColor: Colors.green,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute (
                  builder: (BuildContext context) =>  EditProfilePage(0,'Edit Profile'),
                ),);
              }, imageAsset: 'assets/images/resume.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "EDIT INFO",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
      ],
    );
  }
  Widget _buildSettingsButtons2() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.inventory_2,
              iconColor: Colors.red,
              onPressed: () {
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (BuildContext context) => pkg()));
              }, imageAsset: 'assets/images/inventory.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "Packages",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute (
                  builder: (BuildContext context) =>  aboutus(),
                ),);
              }, imageAsset: 'assets/images/info.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "About Us",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.edit,
              iconColor: Colors.purple,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute (
                  builder: (BuildContext context) =>  contactus(),
                ),);
              }, imageAsset: 'assets/images/phone.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "Contact Us",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
      ],
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class HookUpPlus {
  final String title;
  final String subTitle;
  HookUpPlus({required this.title, required this.subTitle});
}

final List<HookUpPlus> hookUpPlusList = [
  new HookUpPlus(
      title: "Loyalty Member", subTitle: "Be a top profile in your area to get more matches!"),
  new HookUpPlus(title: "Platinum", subTitle: "Access to send Messages before accept the request!"),
  new HookUpPlus(
      title: "Gold",
      subTitle: "Access to \"Tune Chat\"!"),
  new HookUpPlus(
      title: "Silver",
      subTitle: "Search results priority over free members!"),
  new HookUpPlus(
      title: "Bronze",
      subTitle: "Increase maximum pending requests count to 3"),

];


