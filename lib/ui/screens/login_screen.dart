import 'dart:io';

import 'package:cygnus/generated/l10n.dart';
import 'package:cygnus/main.dart';
import 'package:cygnus/ui/screens/register_screen.dart';

import 'package:cygnus/ui/widgets/round_icon_button.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/SizeConfig.dart';
import 'package:cygnus/util/utils.dart';
import 'package:enough_mail/mail_address.dart';
import 'package:enough_mail/message_builder.dart';
import 'package:enough_mail/smtp/smtp_client.dart';
import 'package:enough_mail/smtp/smtp_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';
import 'package:cygnus/data/db/remote/response.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _textFieldController = TextEditingController();
  String _inputEmail = '';
  String _inputPassword = '';
  String _inputPassword2 = '';
  bool _isLoading = false;
 late UserProvider _userProvider ;
  late var appLanguage ;
  bool _isObscure = true;
  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
  }
  Future<void> signInWithGoogle( BuildContext _scaffoldKey, BuildContext context) async {


    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await _userProvider
        .loginUsergg(googleUser!.email, context)
        .then((response) {
      if (response.isEmpty) {
        showSnackBar(_scaffoldKey, 'Incorrect Username or password!');
        _isLoading = false;
      }
      else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(OnBoardingPage.id, (route) => false);
      }
    });


  }
  Future<void> signInWithApple( BuildContext _scaffoldKey, BuildContext context) async {


    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

   // print(credential);
    await _userProvider
        .loginUsergg(credential.email??'', context)
        .then((response) {
      if (response.isEmpty) {
        showSnackBar(_scaffoldKey, 'Incorrect Username or password!');
        _isLoading = false;
      }
      else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(OnBoardingPage.id, (route) => false);
      }
    });


  }


  static bool isValidEmail(String email) {
    String p = r"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }
  Future<String?> gett3(String mid,String em) async {

    await _userProvider
        .getlogin(mid,em)
        .then((response) async {
     // _inputPassword2=response;
      if(response!='{message: success}'){

        showSnackBar(context, 'Incorrect Username or password!');
        _isLoading = false;
      }
      else{
        await _userProvider
            .loginUser(em,em,context)
            .then((response) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(OnBoardingPage.id, (route) => false);
        });
      }

      return response;
    });


  }


  void loginPressed() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    if(_inputEmail.isNotEmpty){
      gett3(_inputPassword,_inputEmail).then((data) async {

          // await _userProvider
          //     .loginUser(_inputEmail, _inputPassword2, context)
          //     .then((response) {


      //});


    });
    setState(() {
      _isLoading = false;
    });
    }
    else{
      showSnackBar(context, 'Incorrect Username or password!');
      _isLoading = false;
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   SizeConfig().init(context);
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     resizeToAvoidBottomInset: false,
  //
  //     body:
  //     Container (
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //   child: SingleChildScrollView(
  //
  //   child:
  //           DecoratedBox(
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(image: AssetImage("assets/images/1.png"), fit: BoxFit.cover),
  //     ),
  //     child: Center(child:  SafeArea(
  //       child:  CustomModalProgressHUD(
  //         inAsyncCall: _isLoading,
  //         child: Padding(
  //           padding: kDefaultPadding,
  //           child: Container(
  //
  //             height: SizeConfig.blockSizeVertical * 99,
  //             width: SizeConfig.blockSizeHorizontal * 99,
  //             margin: EdgeInsets.only(bottom: 2),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Login to your account',
  //                   style:TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 40.0,
  //                       fontFamily: 'Forte'
  //                   ),
  //                 ),
  //                 SizedBox(height: 1),
  //                 BorderedTextField(
  //                   labelText: 'Email',
  //                   keyboardType: TextInputType.emailAddress,
  //                   onChanged: (value) => _inputEmail = value,
  //                 ),
  //                 SizedBox(height: 1),
  //                 BorderedTextField(
  //                   labelText: 'Password',
  //                   obscureText: true,
  //                   keyboardType: TextInputType.text,
  //                   onChanged: (value) => _inputPassword = value,
  //                 ),
  //                 SizedBox(height: 10),
  //                 Center(child:
  //                 RoundedOutlinedButton(text: 'LOGIN', onPressed:() {
  //                   Future.delayed(Duration.zero, () {
  //                     loginPressed();
  //                   });
  //
  //
  //                 }
  //
  //                 ),
  //                 ),
  //                 SizedBox(height: 10),
  //                  Center(child: new InkWell(
  //                      child:  Text(
  //                        'Forgotten password?',
  //                        textAlign: TextAlign.center,
  //                        style: TextStyle(
  //                            color: Colors.white,
  //                            fontSize: 20.0, decoration: TextDecoration.underline ,
  //                            fontFamily: 'PoorStory'
  //                        ),
  //                      ),
  //                      onTap: () => {_displayTextInputDialog(context)}
  //                  ),),
  //
  //                 SizedBox(height: 20),
  //                 Text(
  //                   'Login Using...',
  //                   style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 17,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 1),
  //                 Center( child: _buildSettingsButtons()),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),),
  //   ),
  //   ),
  //     );
  //
  //
  //
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
    // 1. Example without prevent image resizing (can be used if the application never show the on-screen keyboard).
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("assets/images/1.png"),
            // image: Image.asset('assets/images/pikachu.png').image,
          ),
        ),
        child:
        CustomModalProgressHUD(
                 inAsyncCall: _isLoading,
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
    height: MediaQuery.of(context).size.height-40,
    width: MediaQuery.of(context).size.width,

    child:



            Column(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 40),
              Text(
                                'Login to your account',
                                style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.0,
                                    fontFamily: 'Forte'
                                ),
                              ),
                              SizedBox(height: 1),
                              BorderedTextField(
                                labelText:  S.of(context).demoSharedXAxisSignInTextFieldLabel,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) => _inputEmail = value,
                              ),
                              SizedBox(height: 1),
                              // BorderedTextField(
                              //   labelText: S.of(context).demoTextFieldPassword,
                              //   obscureText: true,
                              //   keyboardType: TextInputType.text,
                              //   onChanged: (value) => _inputPassword = value,
                              // ),
      TextField(
        obscureText: _isObscure,
        style: TextStyle(color: Colors.white),
        onChanged: (value) => _inputPassword = value,
        decoration: InputDecoration(
          labelText: S.of(context).demoTextFieldPassword,
          labelStyle: TextStyle(color: kSecondaryColor.withOpacity(0.5)),
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),


                              SizedBox(height: 10),
                              Center(child:
                              RoundedOutlinedButton(text: S.of(context).rallyLoginButtonLogin, onPressed:() {
                                Future.delayed(Duration.zero, () {
                                  loginPressed();
                                });


                              }

                              ),
                              ),
                              SizedBox(height: 10),
                               Center(child: new InkWell(
                                   child:  Text(
                                     'Forgotten password?',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 20.0, decoration: TextDecoration.underline ,
                                         fontFamily: 'PoorStory'
                                     ),
                                   ),
                                   onTap: () => {_displayTextInputDialog(context)}
                               ),),


                _buildChild(),

                Align(
                               alignment:Alignment.topLeft,
                               child: Text(
                                'Login Using...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),),
                              SizedBox(height: 1),


                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: _buildSettingsButtons(),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
    ),
      ),
        ),
      ),
    );

  }
  Widget _buildChild() {
    if (MediaQuery.of(context).size.height>700) {

      return  SizedBox(height: 300);


    }
    else{
      return SizedBox(height: 75);

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
        nav.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).demoTextFieldEmail+' '+ S.of(context).replySentLabel),
      content: Text("Check Your Mail Box."),
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
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Forgot Password'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                 // valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter Email Address",hintStyle: TextStyle(color: Color(
                  0xFF000000)),),
            ),
            actions: <Widget>[
           Container(
          width: 120,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(30.0),
                  ),
                ),

                child: Text('OK', style: Theme.of(context).textTheme.button),
                onPressed: (){
                  sendmail(_textFieldController.value.text);
                  //Navigator.pop(context);
                  showAlertDialog(context);

                },

              ),
           ),
              Container(
                width: 120,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape:  RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0),
                    ),
                  ),

                  child: Text('CANCEL', style: Theme.of(context).textTheme.button),
                  onPressed: (){
                    Navigator.pop(context);

                  },

                ),
              ),



            ],
          );
        });
  }

  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
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
              height: 5.0,
            ),
            new Text(
              "Facebook",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.camera_alt,
              iconColor: Colors.red,
              onPressed: () {
                signInWithGoogle(context,context);
              }, imageAsset: 'assets/images/gg.png',
            ),
            new SizedBox(
              height: 5.0,
            ),
            new Text(
              "Google",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),
          Platform.isIOS?
              new Column(
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
              )
            :new Column(
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
          ),
      ],
    );
  }
  Future<UserCredential?> signInWithFacebook() async {
    setState(() {
      _isLoading = true;
    });
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);

      setState(() {
        _isLoading = true;
      });

        await _userProvider
            .loginUserfb(result.accessToken!.token, context)
            .then((response) {
          if(response.isEmpty){

            showSnackBar(context, 'You are not Registered Please Register First!');
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RegisterScreen.id, (route) => false);
            _isLoading = false;
          }
          else{
            Navigator.of(context)
                .pushNamedAndRemoveUntil(OnBoardingPage.id, (route) => false);

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


  Future<void> sendmail(String em) async {
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
      builder.to = [MailAddress(em,em)];
      builder.subject = 'Tune Password Reset';
     // builder.addTextPlain('hello world.');
      builder.addTextHtml('<p><b>Please use this url for password reset</b></p>');
      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      print('message sent: ${sendResponse.isOkStatus}');
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
    }
  }
}
