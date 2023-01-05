import 'dart:convert';


import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/model/planets.dart';
import 'package:cygnus/fcm/message.dart';
import 'package:cygnus/hook/scr/round_icon_button.dart';
import 'package:cygnus/ui/screens/planet_row.dart';
import 'package:cygnus/ui/screens/planet_rowb.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/androidpublisher/v3.dart' as iap;
import '../../data/db/entity/app_user.dart';
import '../../data/model/maril.dart';
import '../../data/model/rel.dart';
import '../../data/model/rel.dart';
import '../../data/model/userdet.dart';
import '../../data/provider/user_provider.dart';
import '../../fcm/token_monitor.dart';
import '../../main.dart';
import '../../util/ad_helper.dart';
import '../../util/constants.dart';
import '../../util/shared_preferences_utils.dart';
import '../widgets/NavBar.dart';
import '../widgets/custom_modal_progress_hud.dart';

class blockscreen extends StatefulWidget {
  // final Widget textInput;
  static const String id = 'blockscreen';

  var textInput=0;
  blockscreen();
  late List<Planet> imageList = [];
  List<Planet> planets = [];
  @override
  State<StatefulWidget> createState() => blockscreenState();
}

class blockscreenState extends State<blockscreen>  with WidgetsBindingObserver{

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? uid = "";
  userdet? userdet1;
  UserProvider? _userProvider;
  AppUser? user;
  bool _isLoading = false;
  bool checkedValue = false;
  late Stream<String> _tokenStream;
  List<bool> _isChecked = [false];
  bool canUpload = false;
  String reli="Select Religion*";
  String marit="Select Marital Status*";
  String onbef="Profile For *";
  String age="Age";
  String dist="District";
  String edu="Select";

  String? _token;
  List<String> _texts = [
    "Show Foreign Profiles Only",

  ];

  List<String> lanlist = [];
  String countryValue2="";

  String? cityValue2="";
  List<String> cityNames =[];
  String? stateValue2="";
  bool _isInForeground = true;
  String verif = "";
  String pstate = "";

  int idx = 0;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _isInForeground = state == AppLifecycleState.resumed;

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }



  // var db = new DatabaseHelper(); // CALLS FUTURE
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _userProvider = Provider.of<UserProvider>(context, listen: false);


      gett3().then((data) {
        //setState(() {

        gett(data?.id).then((data) {
          setState(() {
            planetbl = data;




          });
        });


        //});
        //});
      });






  }




  Future<AppUser?> gett3() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    if(shared_User!=null){
    user = parsePhotos(shared_User.getString('user')).first;
    }
    return user;
  }







  Widget Plane() {
    if( planetbl.isNotEmpty){
      return Scaffold(
        body:
        Column(
            children: <Widget>[

        Container(
          height: MediaQuery
              .of(context)
              .size
              .height-90,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child:
                new CustomScrollView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  slivers: <Widget>[
                    new SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      sliver: new SliverList(
                        delegate: new SliverChildBuilderDelegate(
                              (context, index) => new PlanetRowb(planetbl[index],notifyParent: refresh),
                          childCount: planetbl.length,
                        ),
                      ),
                    ),



                  ],
                ),




        ),

      ]),
      );
    }else{
      return Scaffold(backgroundColor:Colors.white ,
        body:  Center( child: Text("No Data",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );

    }
  }
refresh(){
  setState(() {

  });
}

  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }






  Future<List<Planet>> gett(String? mid) async {
    await _userProvider!.getuserlistbl(mid!).then((response) {
      planetbl = response;

      return response;
    });

    return planetbl;
  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 1,
  title: Text('Blocked Users',style: TextStyle(color: Colors.black),),
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
        key: _scaffoldKey,
        body:  CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Plane(),

    ),



    );

  }
  refreshh() async {


    // setState(() {});
  }


  Widget cntryp2(){
    return CSCPicker(
      ///Enable disable state dropdown [OPTIONAL PARAMETER]
      showStates: false,

      /// Enable disable city drop down [OPTIONAL PARAMETER]
      showCities: false,

      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
      flagState: CountryFlag.DISABLE,

      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          border:
          Border.all(color: Colors.grey.shade300, width: 1)),

      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
      disabledDropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade300,
          border:
          Border.all(color: Colors.grey.shade300, width: 1)),

      ///placeholders for dropdown search field
      countrySearchPlaceholder: "Country",
      stateSearchPlaceholder: "State",
      citySearchPlaceholder: "City",

      ///labels for dropdown
      countryDropdownLabel: "*Country",
      stateDropdownLabel: "*State",
      cityDropdownLabel: "*City",

      ///Default Country
      defaultCountry:null,
      currentCountry: countryValue2,
      currentCity: cityValue2,
      currentState: stateValue2,

      ///Disable country dropdown (Note: use it with default country)
      //disableCountry: true,

      ///selected item style [OPTIONAL PARAMETER]
      selectedItemStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),

      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
      dropdownHeadingStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold),

      ///DropdownDialog Item style [OPTIONAL PARAMETER]
      dropdownItemStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),

      ///Dialog box radius [OPTIONAL PARAMETER]
      dropdownDialogRadius: 10.0,

      ///Search bar radius [OPTIONAL PARAMETER]
      searchBarRadius: 10.0,

      ///triggers once country selected in dropdown
      onCountryChanged: (value) {
        setState(() {
          ///store value in country variable
          currentCountry: countryValue2;
          countryValue2 = value;
          if(value!='*Country'){
            // widget.onChangedcn(value);
          }
        });
      },

      ///triggers once state selected in dropdown
      onStateChanged: (value) {
        setState(() {
          ///store value in state variable
          stateValue2 = value;
          if(value!='*State'){
            // widget.onChangedstate(value);
          }
        });
      },

      ///triggers once city selected in dropdown
      onCityChanged: (value) {
        setState(() {
          ///store value in city variable
          cityValue2 = value;
          if(value!='*State'){
            //widget.onChangedcity(value);
          }
        });
      },
    );
  }

}
