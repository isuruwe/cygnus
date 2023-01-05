


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/widgets/round_icon_button.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/SizeConfig.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/ui/widgets/app_image_with_text.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/ui/screens/login_screen.dart';
import 'package:cygnus/ui/screens/register_screen.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../../generated/l10n.dart';
import '../data/db/entity/app_user.dart';



class contactus extends StatefulWidget {
  static const String id = 'aboutus';


  @override
  _contactus createState() => _contactus();
}

class _contactus extends State<contactus> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider;
  bool _isLoading = false;
  LanguageChangeProvider? appLanguage;
  List<Marker> _markers = <Marker>[];
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String cmsg="";
  AppUser? user;
  @override
  void initState() {

    super.initState();
    canLaunch('tel:+94768725021').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
    _markers.add(
        Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(6.915498000073216, 79.85147214959962),
            infoWindow: InfoWindow(
                title: 'Tune Solutions'
            )
        )
    );
    gett().then((data) {
      setState(() {
        this.user = data;
      });
    });
  }



  Future<UserCredential?> logoutFacebook() async {
    await FacebookAuth.instance.logOut();
    return null;
  }

  Future<AppUser?> gett() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return user;
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

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.915498000073216, 79.85147214959962),
    zoom: 14.4746,
  );
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.915498000073216, 79.85147214959962),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,

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

              Container(
                height: MediaQuery.of(context).size.height-50,
                width: MediaQuery.of(context).size.width,
                child:

                Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),

                    Center(

                      child: Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,

                        ),
                      ),

                    ),
                    Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    SizedBox(height: 20),
                    Center(

                      child: Text(
                        'Feel free to contact us any time.we will contact you as soon possible.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,

                        ),
                      ),

                    ),


                    Center(
                      child:  TextFormField(
                        minLines: 5,
                        maxLines: 15,
                        keyboardType: TextInputType.multiline,
                        style:  TextStyle(
                            color: Colors.black
                        ),
                        onChanged: (value) => {
                          setState(() {
                            var age = value;
                            cmsg= value;
                          }),

                        },
                        decoration: InputDecoration(

                          hintText: 'Your Message',
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ),
                    RoundedOutlinedButton(
                        text: 'Submit',
                        onPressed:(){ sendmail(cmsg,user?.id??'',user?.name??'');} ),
                    _buildSettingsButtons(),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: _kGooglePlex,
                          markers: Set<Marker>.of(_markers),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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

                          Navigator.pop(context);
                        },
                        child: Center(
                          child: new Text(S.of(context).demoSharedXAxisBackButtonText
                            ,
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),),
                    ),
                    SizedBox(height: 50),


                  ],
                ),),
            ),
          ),
        ),
      ),
    );

  }



  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[

            IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.green,
              ),
              onPressed: () {

                  _launched = _makePhoneCall('+94768725021');


              },
            ),

            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "Call",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              onPressed: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'info@tunelk.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Tune Matrimony'
                  }),
                );
                launch(emailLaunchUri.toString());
              },
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "Email",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.sms,
                color: Colors.green,
              ),
              onPressed: () {
                _textMe();
              },
            ),
            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "SMS",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
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
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }


  void launchUrl2() async{
    var url = 'fb://facewebmodal/f?href=https://www.facebook.com/tune.solutions';
    if (await canLaunch(url)) {
      await launch( url, universalLinksOnly: true, );
    } else { throw 'There was a problem to open the url: $url'; }

  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
  _textMe() async {
    if (Platform.isAndroid) {
      const uri = 'sms:+94768725021?body=hello%20there';
      await launch(uri);
    } else if (Platform.isIOS) {
      // iOS
      const uri = 'sms:0094768725021&body=hello%20there';
      await launch(uri);
    }
  }
  void launchUrl1() async{

    var url = 'https://twitter.com/tune.solutions';
    if (await canLaunch(url)) {
      await launch( url, universalLinksOnly: true, );
    } else { throw 'There was a problem to open the url: $url'; }

  }
  var appPackageName="com.icw.cygnus.cygnus";
  void launchps(){
    try {

      launch("market://details?id=" + appPackageName);
    } on PlatformException catch(e) {
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    } finally {
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    }

  }

  _launchURL() async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
        await launch(
            'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
            forceSafariVC: false);
      } else {
        if (await canLaunch(
            'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
          await launch(
              'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
        } else {
          throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
        }
      }
    } else {
      const url = 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
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
      builder.addTextHtml('<p><b>User has message for Tune</b></p><p><b>'+em+'</b></p>User id:'+em1+' Name:'+em2);

      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      showAlertDialog(context);
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

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Thank you'),
      content: Text("Your Message Submitted."),
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

