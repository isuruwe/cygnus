


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
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../../generated/l10n.dart';
import '../../FabCircularMenu.dart';


class aboutus extends StatefulWidget {
  static const String id = 'aboutus';


  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider;
  bool _isLoading = false;
  late LanguageChangeProvider appLanguage ;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  void initState() {

    super.initState();

    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);

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



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('About Us',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
              Navigator.pop(context);
           // Navigator
             //   .of(context)
              //  .push(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen()));

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          //   image: AssetImage("assets/images/1.png"),
          //   // image: Image.asset('assets/images/pikachu.png').image,
          // ),
        ),
        child:
        Padding(
          padding: kDefaultPadding,

          child:
          Scaffold(

            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,

            body: SingleChildScrollView(

              child:



                Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //SizedBox(height: 5),


                    GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      image: Image.asset(
                        'assets/images/b1.jpg',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      showImage: true,
                      title: GFListTile(
                        avatar: GFAvatar(
                          backgroundImage: AssetImage('assets/images/tune.png'),size: GFSize.LARGE,
                       ),
                        titleText: 'Tune Solutions',
                        subTitleText: 'Matrimony App',
                      ),
                      content: Text("\"Tune\" is a matrimony website created by Tune Solutions (Pvt) Ltd.\n"+

              "Tune is operating on a secure platform built in accordance with global standards, with utmost priority for privacy and data security.\n"+

                "Tune Solutions (Pvt) Ltd. provide the service through service package options for the"+
                "prospective customers to select and purchase through the “mobile payment” option.\n"+

                "The"+
                "customer can simply download the app and create an account in it or create an account in the website with his personal details. The next step is to select preferred packages through the available five package options namely Bronze, Silver, Gold, Platinum and Loyalty package. The differences between the packages will be mainly based on other"+
                "profiles viewing capacity, connection requesting capacity, and proposes matching priority.\n"+

                    "Company Name: Tune Solutions (Pvt) Ltd.\n"+
                    "Mobile App: Tune \n"+
                "Website: Tunelk.com"),

                    ),

                    // SizedBox(height: 10),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child:   Container(
                    //     width: 200,child:new ElevatedButton(
                    //
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.white,
                    //       shape:  RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(55.0)),
                    //     ),
                    //
                    //
                    //     onPressed: () {
                    //
                    //
                    //
                    //     },
                    //     child: Center(
                    //       child: new Text(S.of(context).demoSharedXAxisBackButtonText
                    //         ,
                    //         style: TextStyle(color: Colors.black, fontSize: 16.0),
                    //       ),
                    //     ),
                    //   ),),
                    // ),
                    // SizedBox(height: 50),
                    // Center(
                    //
                    //
                    //   child:  Text(
                    //     'All Right Reserved@Tune Solutions',
                    //     style: TextStyle(color: Colors.black, fontSize: 20.0),
                    //   ),
                    //
                    // ),

                  ],
                ),
            ),
          ),
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
        fabOpenIcon: Icon(Icons.menu, color: Colors.pinkAccent),
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
          ),), Center(

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

