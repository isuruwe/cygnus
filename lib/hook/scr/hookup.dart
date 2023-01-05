import 'dart:convert';

import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/hook/scr/card_stack.dart';
import 'package:cygnus/hook/scr/draggable_card.dart';
import 'package:cygnus/hook/scr/matches.dart';
import 'package:cygnus/hook/scr/profile_card.dart';
import 'package:cygnus/hook/scr/profiles.dart';
import 'package:cygnus/hook/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../ui/screens/ViewProfilePage.dart';
import '../../ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'RoundIconButton2.dart';
import 'round_icon_button.dart';
import 'package:cygnus/hook/pre/layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cygnus/util/ad_helper.dart';

// TODO: Import google_mobile_ads.dart
import 'package:google_mobile_ads/google_mobile_ads.dart';
late List<Profile> imageList =[];
late AppUser? appUser1x=new AppUser(profilePhotoPath: "",id:"1",name: "",age: 0);
late MatchEngine matchEngine = new MatchEngine(
  matches: imageList.map((Profile profile) {
    return new DateMatch(profile: profile,user:appUser1x);
  }).toList(),
);

class HookUp extends StatefulWidget {
  @override
  _HookUpState createState() => _HookUpState();
}

class _HookUpState extends State<HookUp>
    with AutomaticKeepAliveClientMixin<HookUp> {
  String? uid="";
  userdet? userdet1;
  UserProvider? _userProvider;
  AppUser? user;
  bool _isLoading=false;
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  @override
  void initState()  {
    super.initState();
    _initGoogleMobileAds();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
    //  setState(() {

        gett3().then((data) {
          //setState(() {
            gett(uid).then((data) {
             // setState(() {

             // });
            });
          //});
        //});


      });

        gettr3(uid).then((data1) {
          //setState(() {
            if(data1!.isNotEmpty ){

            }
            else{
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => EditProfilePage(1,'Add your Partner Preference')),
              );

            }
        //  });

        });

    });



    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  Future<String?> gettr3(String? mid) async {
    String? hj;

    await _userProvider!.getpartneradd(mid!).then((response) {

      hj=response;
      return hj;
    });

    return hj;
  }




  Future<AppUser?> gett3() async {

    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return user;

  }
  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  Future<String?> gett2() async {


    uid= (await SharedPreferencesUtil.getUserId());
    // SharedPreferences shared_User = await SharedPreferences.getInstance();
    // user= parsePhotos(shared_User.getString('user')).first;




    return uid;
  }
  Future<List<Profile>> gett(String? mid) async {

    await _userProvider!
        .getuserlist(mid!)
        .then((response) {
      imageList=response;
      matchEngine = new MatchEngine(
        matches: imageList.map((Profile profile) {
          return new DateMatch(profile: profile,user:user);
        }).toList(),user: user
      );



      return response;
    });

    return imageList;
  }


  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           if (_isBannerAdReady)
            //  Align(
             //   alignment: Alignment.bottomCenter,
               // child:
              Container(
                  width:_bannerAd.size.width.toDouble()+(MediaQuery.of(context).size.width-_bannerAd.size.width.toDouble())-115,
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
            //  ),
 // }
            // new SizedBox(width: 2,),
            // new RoundIconButton.large(
            //   icon: Icons.clear,
            //   iconColor: Colors.red,
            //   onPressed: () {
            //     matchEngine.currentMatch.nope();
            //   }, imageAsset:'assets/images/close.png',
            // ),
            // new RoundIconButton.small(
            //   icon: Icons.star,
            //   iconColor: Colors.red,
            //   onPressed: () {
            //     matchEngine.currentMatch.like();
            //   }, imageAsset: 'assets/images/love.png',
            // ),
            // new RoundIconButton.small(
            //   icon: Icons.cancel,
            //   iconColor: Colors.green,
            //   onPressed: () {
            //     matchEngine.currentMatch.like();
            //
            //   }, imageAsset: 'assets/images/close.png',
            // ),
            new RoundIconButton2.small(
              icon: Icons.info,
              iconColor: Colors.pinkAccent,
              onPressed: () {
                sendMessagePressed(context);

              }, imageAsset: 'assets/images/minfo.png',
            ),
            //new SizedBox(width: 1,),
            // new RoundIconButton.widget(
            //   imageAsset: '',
            //   iconColor: Colors.purple,
            //   onPressed: () {}, icon: null as IconData,
            // )
          ],
        ),
      ),
    );
  }

  void sendMessagePressed(BuildContext context)  {
    if(matchEngine.currentMatch.user!=null) {

      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) =>
          ViewProfilePage(uidnew: matchEngine.currentMatch.profile.id)));

    }
  }
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if(imageList.length>1){

 // return   FutureBuilder(
 //      future:  gett(uid),
 //      builder: (context, snapshot) {
 //        if (snapshot.hasData) {
 //          return
 //            CustomModalProgressHUD(
 //              inAsyncCall: _isLoading,
 //              child:
 //              Scaffold(
 //                body: new CardStack(matchEngine: matchEngine),
 //                bottomNavigationBar: _buildBottomBar(),
 //              ), );
 //        } else {
 //          return Column(children:[Padding(padding: EdgeInsets.only(top: 20.0)),CircularProgressIndicator(
 //            backgroundColor: Colors.white,
 //            strokeWidth: 1,
 //          ),] );
 //        }
 //      },
 //    );
  return

    Scaffold(
        body: new CardStack(matchEngine: matchEngine),
        bottomNavigationBar: _buildBottomBar(),
      );




    }
    else{
      gett2().then((data) {
        setState(() {

          gett(uid).then((data) {
            setState(() {

            });
          });


        });
      });
      return Column(children:[Padding(padding: EdgeInsets.only(top: 20.0)),CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 1,
      ),] );
    }
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
List<Profile> payloadFromJson1(String str) => List<Profile>.from(json.decode(str).map((x) => Profile.fromJson1(x)));

String payloadToJson1(List<Profile> data) => json.encode(List<Profile>.from(data.map((x) => x.toJson1())));

class Payload1 {
  String? name;
  String? bio;
  String? location;
  String? age;
  List<String>? photos;

  Payload1({
    required this.name,
    required this.bio,
    required this.location,
    required this.age,
    required this.photos,
  });

  factory Payload1.fromJson1(Map<String, dynamic> json) => Payload1(
    name: json["name"] == null ? null : json["name"],
    bio: json["bio"] == null ? null : json["bio"],
    location: json["location"] == null ? null : json["location"],
    age: json["age"] == null ? null : json["age"],
    photos: json["photos"] == null ? null : json["photos"].split(',').toList(),
  );

  Map<String, dynamic> toJson1() => {
    "name": name == null ? null : name,
    "bio": bio == null ? null : bio,
    "location": location == null ? null : location,
    "age": age == null ? null : age,
    "photos": photos == null ? null : photos,
  };
}