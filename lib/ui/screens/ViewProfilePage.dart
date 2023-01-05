import 'dart:convert';
//import 'dart:html';
import 'dart:ui' as ui;
import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/data/provider/user_provider.dart';
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

import '../../hook/scr/round_icon_button.dart';
import 'chat_screen.dart';





class ViewProfilePage extends StatefulWidget {
  static const String id = 'ViewProfilePage';
  final String? uidnew;
  ViewProfilePage(
      {required this.uidnew,
       });


  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  bool showPassword = false;
  DateTime selectedDate = DateTime.now();


  PhoneNumberUtil plugin =new PhoneNumberUtil();

  final UserRegistration _userRegistration = UserRegistration();
  String countryValue="";

  String? cityValue="";

  String? stateValue="";
  String countryValue2="";

  String? cityValue2="";

  String? stateValue2="";

  String phone="";
  String? gen='';
  String ctcode="";
  var dateTime1;
  String textcode="";
  UserProvider? _userProvider;

  String? uid="";
  String? uid1="";
  userdet? userdet1;
  AppUser? user;
  bool _isLoading=false;

  RangeValues _currentRangeValues = const RangeValues(16, 60);

  @override
  void initState()  {

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2(context).then((data) {
     // setState(() {


        gett(data).then((data2) {
          setState(() {


userdet1=data2;
          dateTime1  = DateTime.tryParse(userdet1?.birthday??"");
if(userdet1?.gender=='1'){
  gen='Male';
}
if(userdet1?.gender=='2'){
  gen='Female';
}

          });
      ///  });



      });
    });
    super.initState();
  }

  @override
  void dispose() {


    super.dispose();
  }


  Future<String?> gett2(BuildContext c) async {

    //final arguments = ModalRoute.of(c)!.settings.arguments as Map;

    if (widget.uidnew != null){
      uid=widget.uidnew;
    }
     uid1= (await SharedPreferencesUtil.getUserId());
    // SharedPreferences shared_User = await SharedPreferences.getInstance();
    // user= parsePhotos(shared_User.getString('user')).first;
    return widget.uidnew;
  }
  Future<userdet?> gett(String? mid) async {

      await _userProvider!
        .getUserdet(mid!)
        .then((response) {
        userdet1=response;
      return response;
    });

      return userdet1;
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
              title: Text('Profile',style: TextStyle(color: Colors.black),),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                ),
                onPressed: () {
                //  Navigator.pop(context);
                  Navigator
                      .of(context)
                      .push(new MaterialPageRoute(builder: (BuildContext context) => TopNavigationScreen(1,0,0)));

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
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
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
                              color: Colors.green,
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


                buildAccountOptionRow(context,'First Name',userdet1?.firstName??''),
                SizedBox(
                  height:5,
                ),
                buildAccountOptionRow(context,'Last Name',userdet1?.lastName??''),
                SizedBox(
                  height: 2,
                ),

                buildAccountOptionRow(context,'Date of Birth','${dateTime1?.year??''}-${dateTime1?.month??''}-${dateTime1?.day??''}'),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Gender',gen),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Religion',userdet1?.religion??''),
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
                buildAccountOptionRow(context,'Occupation',userdet1?.designation??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Monthly Income','${userdet1?.income}${userdet1?.curr}'),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Marital Status',userdet1?.marital??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Weight',userdet1?.diet??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Country',userdet1?.country??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'State',userdet1?.state??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Height',userdet1?.height??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Bio',userdet1?.introduction??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Phone',userdet1?.phone??''),
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
                      "User Preferences",
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
                buildAccountOptionRow(context,'Religion should be',userdet1?.prefrel??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Education should be',userdet1?.prefedu??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Job should be',userdet1?.profession??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Income should be',userdet1?.prefincome??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Marital Status should be',userdet1?.prefms??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Diet should be',userdet1?.prefdiet??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Country should be',userdet1?.prefcntry??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'State should be',userdet1?.prefst??''),
                SizedBox(
                  height: 2,
                ),
                buildAccountOptionRow(context,'Age should be',int.parse(userdet1?.agemin??0.toString()).round().toString()+' to '+int.parse(userdet1!.agemax??0.toString()).round().toString()),




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
  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[



            new RoundIconButton.small(
              icon: Icons.settings,
              iconColor: Colors.red,
              bColor:Colors.white ,
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute (
                //   builder: (BuildContext context) =>  SettingsPage(),
                // ),);
                sendMessagePressed(context);

              }, imageAsset: 'assets/images/ic_chat.png',
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "Chat",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
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
  void sendMessagePressed(BuildContext context) async {
    // AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;
    var uid= (await SharedPreferencesUtil.getUserId());
    if(uid!=null) {
      Navigator.pop(context);
      Navigator.pushNamed(context, ChatScreen.id, arguments: {
        "chat_id": compareAndCombineIds(uid, userdet1!.uid),
        "user_id": uid,
        "other_user_id":userdet1!.uid
      });
    }
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





  Widget buildAccountOptionRow(BuildContext context, String title,String? body) {
    return Row(
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
            Text(
              body!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
            ),
          ],
        );

  }



}
enum HeightUnit { ft, cm }