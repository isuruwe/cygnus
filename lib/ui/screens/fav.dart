import 'dart:convert';


import 'package:cygnus/data/model/planets.dart';
import 'package:cygnus/ui/screens/planet_row.dart';
import 'package:cygnus/ui/screens/planet_row3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/db/entity/app_user.dart';
import '../../data/model/userdet.dart';
import '../../data/provider/user_provider.dart';
import '../../util/shared_preferences_utils.dart';
import 'PlanetRow2.dart';

class fav extends StatefulWidget {
  // final Widget textInput;
  // fav({required this.textInput});
  static const String id = 'fav';
  late List<Planet> imageList = [];
  var _selectedIndex = 0;
  fav(this._selectedIndex);
  @override
  State<StatefulWidget> createState() => favState();
}

class favState extends State<fav> {
  // List<Planet> planets = [];
  // List<Planet> planets2 = [];
  // List<Planet> planetsb = [];
  // List<Planet> planetsm = [];
  String? uid = "";
  userdet? userdet1;
  UserProvider? _userProvider;
  AppUser? user;
  bool _isLoading = false;
 int sl=0;
  // var db = new DatabaseHelper(); // CALLS FUTURE
  @override
  void initState() {
    super.initState();
    _tabChanged(widget._selectedIndex);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
      //  setState(() {

      gett3().then((data) {
        //setState(() {

        //});
        //});
      });
    });
  }

  Future<AppUser?> gett3() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user = parsePhotos(shared_User.getString('user')).first;
    return user;
  }
  Map<int, Widget> _tabs = {
    0: Tab( child:
    Image.asset('assets/images/h1.png'),


    // Text(
    //   'Bookmarks',
    //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
    // ),
    ),
    1: Tab(child:  Image.asset('assets/images/h8.png'),
    // Text(
    //   'Requested',
    //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
    // ),
    ),
    2: Tab(child:   Image.asset('assets/images/h6.png'),
    // Text(
    //    'Matched',
    //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
    // ),
     ),
    3: Tab(child:  Image.asset('assets/images/h7.png'),
    // Text(
    //   'Received',
    //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
    // ),
    ),
  };
  Map<int, Widget> _tabs0 = {
    0: Tab( child:
    Image.asset('assets/images/h1.png'),


      // Text(
      //   'Bookmarks',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    1: Tab(child:  Image.asset('assets/images/h8.png'),
      // Text(
      //   'Requested',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    2: Tab(child:   Image.asset('assets/images/h6.png'),
      // Text(
      //    'Matched',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    3: Tab(child:  Image.asset('assets/images/h7.png'),
      // Text(
      //   'Received',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
  };
  Map<int, Widget> _tabs1 = {
    0: Tab( child:
    Image.asset('assets/images/h5.png'),


      // Text(
      //   'Bookmarks',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    1: Tab(child:  Image.asset('assets/images/h4.png'),
      // Text(
      //   'Requested',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    2: Tab(child:   Image.asset('assets/images/h6.png'),
      // Text(
      //    'Matched',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    3: Tab(child:  Image.asset('assets/images/h7.png'),
      // Text(
      //   'Received',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
  };
  Map<int, Widget> _tabs2 = {
    0: Tab( child:
    Image.asset('assets/images/h5.png'),


      // Text(
      //   'Bookmarks',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    1: Tab(child:  Image.asset('assets/images/h8.png'),
      // Text(
      //   'Requested',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    2: Tab(child:   Image.asset('assets/images/h2.png'),
      // Text(
      //    'Matched',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    3: Tab(child:  Image.asset('assets/images/h7.png'),
      // Text(
      //   'Received',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
  };
  Map<int, Widget> _tabs3 = {
    0: Tab( child:
    Image.asset('assets/images/h5.png'),


      // Text(
      //   'Bookmarks',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    1: Tab(child:  Image.asset('assets/images/h8.png'),
      // Text(
      //   'Requested',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    2: Tab(child:   Image.asset('assets/images/h6.png'),
      // Text(
      //    'Matched',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
    3: Tab(child:  Image.asset('assets/images/h3.png'),
      // Text(
      //   'Received',
      //   style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
      // ),
    ),
  };
  void _tabChanged(int index) {
    setState(() {
      widget._selectedIndex = index;
      if(index==0){
        _tabs=_tabs0;
      }
      if(index==1){
      _tabs=_tabs1;
    } if(index==2){
        _tabs=_tabs2;
      }
      if(index==3){
        _tabs=_tabs3;
      }
      print("Selected Index: $index");
    });
  }

  Widget _showSelectedView() {
    var _selectedView;
    switch (widget._selectedIndex) {
      case 0:
        _selectedView =Bike();

        break;
      case 1:
        _selectedView =Plane ();

        break;
      case 3:
        _selectedView =Plane2 ();

        break;
      default:
                _selectedView = car();


        break;
    }

    return _selectedView;
  }


  Widget Plane() {
    if( planetsrq.isNotEmpty){
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new PlanetRow2(planetsrq[index]),
                    childCount: planetsrq.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body:  Center( child: Text("No Data",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );

    }
  }
  Widget Plane2() {
    if( planetsrc.isNotEmpty){
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color:Colors.white,
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new planet_row3(planetsrc[index],notifyParent: refresh),
                    childCount: planetsrc.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body:  Center( child: Text("No Data",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );

    }
  }
  refresh() async {
    await _userProvider!.getuserlistr(uid!).then((response) {

      setState(() {
        planetsrc = response;
      });

    });

   // setState(() {});
  }

  Widget car() {
    if( planetsm.isNotEmpty){
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new PlanetRow2(planetsm[index]),
                    childCount: planetsm.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body:  Center( child: Text("No Data",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );

    }
  }
  Widget Bike() {
    if( planetsb.isNotEmpty){
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new PlanetRow(planetsb[index],notifyParent: refresh),
                    childCount: planetsb.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      // return Scaffold(
      //   body:   Column(children:[Padding(padding: EdgeInsets.only(top: 20.0,bottom:350.0,left: 500.0 )),CircularProgressIndicator(
      //     backgroundColor: Colors.white,
      //     strokeWidth: 1,
      //   ),] ),
      // );
      return Scaffold(
        body:  Center( child: Text("No Data",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
        ), );
    }
  }

  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }

  Future<String?> gett2() async {
    uid = (await SharedPreferencesUtil.getUserId());
    // SharedPreferences shared_User = await SharedPreferences.getInstance();
    // user= parsePhotos(shared_User.getString('user')).first;

    return uid;
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CupertinoSegmentedControl(
        padding: EdgeInsets.all(15),
        children: _tabs,
        onValueChanged: _tabChanged,
        borderColor: Colors.transparent,
        selectedColor: Colors.transparent,
        unselectedColor: Colors.transparent,
        groupValue: widget._selectedIndex,
      ),
      Expanded(child: _showSelectedView()),
    ]);
  }
}
