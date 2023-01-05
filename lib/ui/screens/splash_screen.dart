import 'dart:async';

import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/start_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class splash_screen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<splash_screen> {
  UserProvider? _userProvider;
  AppUser? user;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett3().then((data) {
      setState(() {


      });
    });
    startTime();

  }
  Future<AppUser?> gett3() async {

    _userProvider?.getUser().then((value) {
      setState(() {
        user = value;
        // Future is completed with a value.
      });
    });
    return user;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  Future<void> checkIfUserExists() async {
    String? userId = await SharedPreferencesUtil.getUserId();
    // Navigator.pop(context);

    if (userId != null) {
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(1,0,0)));
    }
    else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartScreen()));
    }
  }
  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, checkIfUserExists);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body:

      Container(
          decoration: BoxDecoration(
            //color: Colors.pinkAccent,
            image: DecorationImage(
              fit: BoxFit.fill,
             // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
             image: AssetImage("assets/images/s1.jpg"),

             // image: Image.asset('assets/images/pikachu.png').image,
            ),
          ),


        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   child: Image.asset("assets/images/tinder_icon.png"),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            // Text(
            //   "Tune Solutions",
            //   style: TextStyle(fontSize: 20.0, color: Colors.white),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.white,
            //   strokeWidth: 1,
            // )
          ],
        ),
      ),
    );
  }
}
