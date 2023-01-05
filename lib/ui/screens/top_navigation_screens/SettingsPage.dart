import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/setings/phoneval.dart';
import 'package:cygnus/ui/screens/setings/validation.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsTab.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../setings/VerifyPhoneNumberScreen.dart';

class SettingsPage extends StatefulWidget {
  static const String id = 'SettingsPage';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider ;
  String valueText="";
  late LanguageChangeProvider appLanguage ;
  String valueText1="";
  String valueText2="";
  late Widget alertWidget;
  bool showblur = false;
  bool _isLoading = false;

  String uid="";
  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      uid = (arguments['name']);
    }
    return Scaffold(
      key: _scaffoldKey,
      body:  CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        child:


      Container(
        color:Colors.white ,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
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
                  "Account",
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
            buildAccountchgpw(context, "Change password"),
            buildAccountOptionnic(context, "Account Verification"),
            //buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            //buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.volume_up_outlined,
            //       color: Colors.green,
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     // Text(
            //     //   "Notifications",
            //     //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     // ),
            //   ],
            // ),
            // Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            SizedBox(
              height: 10,
            ),
           // buildNotificationOptionRow("Notifications", true),
            // buildNotificationOptionRow("Account activity", true),
            // buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton( style:
              OutlinedButton.styleFrom(
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 40),
              ),


                onPressed: () {
                  //Navigator.pushNamed(context, TopNavigationScreen.id);
                  Navigator.pop(context);
                },
                child: Text("BACK",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
  static bool isPassMatch(String value, String value2) {
    return value.contains(value2);
  }
  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: ()
    {
      // nicval();

      showDialog(
          context: context,
          builder: (BuildContext context) {
   return   AlertDialog(
        title: Text('Languages'),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<LanguageChangeProvider>(context, listen: false)
                    .changeLocale("en");
                Navigator.of(context).pop();
              },
              child: Text("English")),
          TextButton(
              onPressed: () {
                Provider.of<LanguageChangeProvider>(context, listen: false)
                    .changeLocale("si");
                Navigator.of(context).pop();
              },
              child: Text("සිංහල")),
          TextButton(
              onPressed: () {
                Provider.of<LanguageChangeProvider>(context, listen: false)
                    .changeLocale("hi");
                Navigator.of(context).pop();
              },
              child: Text("हिंदी")), TextButton(
              onPressed: () {
                Provider.of<LanguageChangeProvider>(context, listen: false)
                    .changeLocale("ta");
                Navigator.of(context).pop();
              },
              child: Text("தமிழ்")),
        ],
      );
    });

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
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
  GestureDetector buildAccountOptionnic(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                  ],
                ),
                actions: [
                  RoundedButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute (
                        //   builder: (BuildContext context) =>  validation(),
                        // ),);

                          Navigator.pushNamed(context, validation.id,arguments: {"name" :
                          uid});


                      },
                      text: 'NIC',
                      ),  RoundedButton(
                    onPressed: () {
                      _displayTextInputDialog(context);

                    },
                    text: 'Phone',
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
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
  GestureDetector buildAccountchgpw(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          valueText2 = value;
                        });
                      },
                      controller: _textFieldController2,
                      decoration: InputDecoration(hintText: "Enter Old Password",hintStyle: TextStyle(color: Color(
                          0xFF000000)),),
                    ),


                    // password input
                    TextField(obscureText: true,
                      onChanged: (value) {
                        setState(() {
                           valueText1 = value;
                        });
                      },
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: "Enter New Password",hintStyle: TextStyle(color: Color(
                          0xFF000000)),),
                    ),

                    // password input
                    TextField(obscureText: true,
                      onChanged: (value) {
                        setState(() {
                           valueText = value;
                        });
                      },
                      controller: _textFieldController1,
                      decoration: InputDecoration(hintText: "Enter Confirm Password",hintStyle: TextStyle(color: Color(
                          0xFF000000)),),
                    ),

                    // submit button


                  ],
                ),
                actions: [
                  RoundedOutlinedButton(
                    text: 'Reset Password',

                    // add your on tap handler here
                    onPressed: () async {
                      if(!isPassMatch(valueText,valueText1)){
                        showSnackBar(
                            context, 'Password Not Match!');
                      }
                      else if(valueText.isEmpty){
                        showSnackBar(
                            context, 'Confirm Password field required!');

                      }
                      else if(valueText1.isEmpty){

                        showSnackBar(
                            context, 'Password field required!');
                      }
                      else{
                        _isLoading = true;
                        await _userProvider!
                            .uppass(valueText1, context)
                            .then((response) {
                          if(response.isEmpty){

                            showSnackBar(context, 'Error!');
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                            _isLoading = false;
                          }
                          else{
                            showSnackBar(context, 'Password Changed Successfully!');
                            Navigator.of(context, rootNavigator: true).pop('dialog');

                          }
                        });
                      }
                    },
                  ),
                  RoundedOutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Close',
                     ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
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
            title: Text('Phone Verification'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  // valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter Phone Number with country code",hintStyle: TextStyle( fontSize:12, color: Color(
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

                  child: Text('Send OTP', style: Theme.of(context).textTheme.button),
                  onPressed: (){

                    Navigator
                        .of(context)
                        .push(new MaterialPageRoute(builder: (BuildContext context) => VerifyPhoneNumberScreen(phoneNumber:_textFieldController.value.text.contains('+')?_textFieldController.value.text:"+"+_textFieldController.value.text,)));
                    //Navigator.pop(context);
                   // showAlertDialog(context);

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

  Widget   nicval(){
return  GFAlert(
  alignment: Alignment.center,
  backgroundColor: Colors.white,
  title: 'Welcome!',
  content:
  'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
  type: GFAlertType.rounded,
  bottombar: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      GFButton(
        onPressed: () {
          setState(() {
            alertWidget = null as Widget;
            showblur = false;
          });
        },
        color: GFColors.LIGHT,
        child: const Text(
          'Close',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  ),
);

  }
}