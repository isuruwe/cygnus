


import 'dart:io';

import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/widgets/round_icon_button.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/SizeConfig.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/ui/widgets/app_image_with_text.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/ui/screens/login_screen.dart';
import 'package:cygnus/ui/screens/register_screen.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../data/model/maril.dart';
import '../../data/model/planets.dart';
import '../../data/model/rel.dart';
import '../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../generated/l10n.dart';
import '../FabCircularMenu.dart';


class StartScreen extends StatefulWidget {
  static const String id = 'start_screen';


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<StartScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider;
  bool _isLoading = false;
  LanguageChangeProvider? appLanguage;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  void initState() {
   // checkIfUserExists();
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
    getrel().then((data) {
      setState(() {
        religions = data;
      });
    });
    getmaril().then((data) {
      setState(() {
        marils = data;
      });
    });
    getonbef().then((data) {
      setState(() {
        onbefs = data;
      });
    });
    getcurr().then((data) {
      setState(() {
        curry = data;
      });
    });
    getlan().then((data) {
      setState(() {
        langs = data;
        langst = langs.map((city) => city.name.toString()).toList();
      });
    });
  }

  Future<List<maril>> getlan() async {
    await _userProvider!.getlangs().then((response) {
      langs = response;

      return response;
    });

    return langs;
  }
  Future<List<maril>> getonbef() async {
    await _userProvider!.getonbefs().then((response) {
      onbefs = response;

      return response;
    });

    return onbefs;
  }

  Future<List<rel>> getrel() async {
    await _userProvider!.getrel().then((response) {
      religions = response;

      return response;
    });

    return religions;
  }
  Future<List<maril>> getmaril() async {
    await _userProvider!.getmarit().then((response) {
      marils = response;

      return response;
    });

    return marils;
  }

  Future<List<maril>> getcurr() async {
    await _userProvider!.getcur().then((response) {
      curry = response;

      return response;
    });

    return curry;
  }

  Future<UserCredential?> logoutFacebook() async {
    await FacebookAuth.instance.logOut();
    return null;
  }


  Future<void> checkIfUserExists() async {
    String? userId = await SharedPreferencesUtil.getUserId();
   // Navigator.pop(context);

    if (userId != null) {
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(1,0,0)));
    }
  }
  Future<UserCredential?> signInWithFacebook() async {
    setState(() {
      _isLoading = true;
    });
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);



      await _userProvider!
          .signUserfb(result.accessToken!.token, _scaffoldKey)
          .then((response) {
        if(response==null){

          showSnackBar(context, 'FB Authorization failed!');

          _isLoading = false;
        }
        else{
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RegisterScreen.id, (route) => false);

        }
      });
      setState(() {
        _isLoading = false;
      });




      // Once signed in, return the UserCredential
      //return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
//   @override
//   Widget build(BuildContext context) {
//     return   CustomScrollView(
//       slivers: [
//         SliverFillRemaining(
//           hasScrollBody: true,
//           child: DecoratedBox(
//       decoration: const BoxDecoration( color: Colors.white,
//         image: DecorationImage(image: AssetImage("assets/images/1.png"), fit: BoxFit.cover),
//       ),
//       child: Center(child: SafeArea(
//         child: Scaffold(
//           body: Padding(
//             padding: kDefaultPadding,
//             child: Container(
//
//               margin: EdgeInsets.only(bottom: 1, top: 20),
//               child: Column(
//                 children: [
//                   AppIconTitle(),
//
//                   Expanded(
// flex: 1,
//
//                       child: Text(
//                         'New to Tune',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30.0,
//                           fontFamily: 'Forte'
//                       ),
//                       ),
//
//                   ),
//
//                   RoundedOutlinedButton(
//                     text: 'Sign Up with Email',
//                     onPressed:  () {
//
//                       fun1(context);},
//
//                   ),
//
//                   Expanded(
// flex: 1,
//
//                       child:  Text(
//                         'Sign Up using...',
//                         style: TextStyle(color: Colors.white, fontSize: 15.0),
//                       ),
//
//                   ),
//
//                   Expanded(flex: 1, child: _buildSettingsButtons()),
//
//
//                   Expanded(
//                     flex: 1,
//
//                       child:  Text(
//                         'Already have Account',
//                         style: TextStyle(color: Colors.black, fontSize: 20.0),
//                       ),
//
//                   ),
//                  Align(
//             alignment: Alignment.bottomCenter,
//             child:   Container(
//                    width: 200,child:new ElevatedButton(
//
//                    style: ElevatedButton.styleFrom(
//                      primary: Colors.white,
//                      shape:  RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(55.0)),
//                    ),
//
//
//                    onPressed: () {
//
//                      fun2(context);
//
//                    },
//                    child: Center(
//                      child: new Text(
//                        "LOGIN",
//                        style: TextStyle(color: Colors.black, fontSize: 16.0),
//                      ),
//                    ),
//                  ),),
//         )
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ) ,
//       ),
//     ),
//     ),
//     ],
//     );
//
//
//
//   }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: _buildfloat(),
      resizeToAvoidBottomInset: false,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("assets/images/1.png"),
            // image: Image.asset('assets/images/pikachu.png').image,
          ),
        ),
        child:
        Padding(
          padding: kDefaultPadding,

          child:
          // Scaffold(
          //
          //   backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,

            //body:
            // SingleChildScrollView(
            //
            //   child:

              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   child:

              Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppIconTitle(),

                  Center(

                    child: Text(
    'New to Tune',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                         // fontFamily: 'Forte'
                      ),
                    ),

                  ),

                  RoundedOutlinedButton(
                    text:  S.of(context).rallyLoginSignUp,
                    onPressed:  () {

                      fun1(context);
    },

                  ),

                  Center(


                    child:  Text(
                      'Sign Up using...',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),

                  ),

                  Center( child: _buildSettingsButtons()),
                  SizedBox(height: 50),

                  Center(


                    child:  Text(
                      'Already have Account',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),

                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:   Container(
                      width: 200,child:new ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55.0)),
                      ),


                      onPressed: () {

                        fun2(context);

                      },
                      child: Center(
                        child: new Text(S.of(context).rallyLoginLabelLogin
                          ,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),),
                  ),
                ],
              ),
            //  ),
          //  ),
        //  ),
        ),
      ),
    );

  }

  Widget _buildfloat() {
   return Builder(
      builder: (context) => FabCircularMenu(
        key: fabKey,
        // Cannot be `Alignment.center`
        alignment: Alignment.topLeft,
        ringColor: Colors.white.withAlpha(85),
        ringDiameter: 500.0,
        ringWidth: 150.0,
        fabSize: 64.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        // Also can use specific color based on wether
        // the menu is open or not:
        // fabOpenColor: Colors.white
        // fabCloseColor: Colors.white
        // These properties take precedence over fabColor
        fabColor: Colors.white,
        fabOpenIcon: Icon(Icons.language_sharp, color: Colors.pinkAccent),
        fabCloseIcon: Icon(Icons.close, color: Colors.pink),
        fabMargin: const EdgeInsets.all(16.0),
        animationDuration: const Duration(milliseconds: 800),
        animationCurve: Curves.easeInOutCirc,
        onDisplayChange: (isOpen) {
          //showSnackBar(_scaffoldKey, "The menu is ${isOpen ? "open" : "closed"}");
        },
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("en");
              fabKey.currentState!.close();
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child:  Text('English'),
          ),
          RawMaterialButton(
            onPressed: () {
              Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("si");
              fabKey.currentState!.close();
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Text('සිංහල'),
          ),
          RawMaterialButton(
            onPressed: () {
              Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("hi");
              fabKey.currentState!.close();
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Text('हिंदी'),
          ),
          RawMaterialButton(
            onPressed: () {
              Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale("ta");
              fabKey.currentState!.close();
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Text('தமிழ்'),
          )
        ],
      ),
    );
  }

  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(

          child:
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.settings,
              iconColor: Colors.blue,
              onPressed: () {
                signInWithFacebook();
              }, imageAsset: 'assets/images/fb.png',
            ),
            new SizedBox(
              height: 1.0,
            ),
            new Text(
              "Facebook",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),), Center(

          child:
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.red,
              onPressed: () {
                signInWithGoogle(_scaffoldKey,context);
              }, imageAsset: 'assets/images/gg.png',
            ),
            new SizedBox(
              height: 1.0,
            ),
            new Text(
              "Google",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),),
        Platform.isIOS?
        Center(

          child: new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                signInWithApple(context, context);
              }, imageAsset: 'assets/images/apple.png',
            ),
            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "Apple",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),)
            :
        Center(

          child:
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                //TODO
              }, imageAsset: 'assets/images/tw.png',
            ),
            new SizedBox(
              height: 1.0,
            ),
            new Text(
              "Twitter",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),),
      ],
    );
  }
  // Future<UserCredential?> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   if(result.status == LoginStatus.success){
  //     // Create a credential from the access token
  //     final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   }
  //   return null;
  // }
  void fun1(context){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Navigator.pop(context);
     // context.read<LanguageChangeProvider>().changeLocale("hi");
     // context.<LanguageChangeProvider>().changeLocale("hi");

      //appLanguage.changeLocale("en");
      Navigator.pushNamed(context, RegisterScreen.id);
    });
  }
  void fblogout(context){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Navigator.pop(context);
      await FacebookAuth.instance.logOut();
    });
  }


  Future<void> signInWithApple( BuildContext _scaffoldKey, BuildContext context) async {


    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    if(credential!=null){
      SharedPreferencesUtil.setEmail(credential.email??'');
      String fulln=credential.givenName.toString()+credential.familyName.toString();
      SharedPreferencesUtil.setname(fulln);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(RegisterScreen.id, (route) => false);
    }else{

      showSnackBar(context, 'Apple Authorization failed!');
    }


  }

  Future<void> signInWithGoogle( GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context) async {


    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    if(googleUser!=null){
      SharedPreferencesUtil.setEmail(googleUser.email);
      SharedPreferencesUtil.setname(googleUser.displayName);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(RegisterScreen.id, (route) => false);
    }else{

      showSnackBar(context, 'Google Authorization failed!');
    }



  }
  void fun2(context){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.pushNamed(context, LoginScreen.id);
     // Navigator.pushNamed(context, RegisterPage.id);
    });
  }

}

