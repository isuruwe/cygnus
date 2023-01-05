import 'dart:convert';


import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/model/planets.dart';
import 'package:cygnus/fcm/message.dart';
import 'package:cygnus/hook/scr/round_icon_button.dart';
import 'package:cygnus/ui/screens/planet_row.dart';
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

class home extends StatefulWidget {
  // final Widget textInput;
  static const String id = 'home';

  var textInput=0;
   home(this.textInput);
  late List<Planet> imageList = [];
  List<Planet> planets = [];
  @override
  State<StatefulWidget> createState() => homeState();
}

class homeState extends State<home>  with WidgetsBindingObserver{

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
  bool _isBannerAdReady = false;
  List<String> lanlist = [];
  String countryValue2="";
  late BannerAd _bannerAd;
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
    setonline(uid,'online');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    setonline(uid,'offline');
    super.dispose();
  }
  void checkpur () {
    final accountCredentials = new auth.ServiceAccountCredentials.fromJson(r'''
{
  "private_key_id": "e4f01565bf992cb2356ebbf9ffb3fc89eef703f3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC6HJBQeXAByDlI\nuZ3K4ZUojxRMEanWolBEkbyO7/Www0YJi3m4XPEHWtEBwAzWEGkKYHR0stm7IJMS\nfz0fDY3WolAz2S1/BfUtFaPTKsXjrxE04c2OOF0lDuhy6iHaRGuaTp6+Wu0t0wCT\nTmdonvOB9g8mb/Xx/KesnZjw92ZiiRfAr/1sd630MXk2k2sXgZEf6NFL1lB7gxaW\npEbcZeAsXBzxX5hmU05GHdjnasVUtWhvbHtKdfV2q0EvTF/fmDQ1LB/3KwVjcrZH\nAbidA/j5TRFzB/3cTTWc9zBDhsU2xTCF/91jRawCqv8Z0Iw5yf4TqaEn97nexdrH\nfngOVPzXAgMBAAECggEADq7jOd4i1pkn39N5HgEHJhCHvuqj1iGvKIHA+Rv4a840\nL9uXqlJ216g0FinDOX5I8z8h4PUdVXSf9dUhCtqkZpsercCEJOHg8oIjDy1wOGLe\n/ieUcpSC0MIo16weKJy+SonKX2VIEhX0FSsZ4Hit6IJztoodws42olk6sEQsiTh6\nJPCd3w2bADBYkyHYuFJggJJnw2OL+jkQ11/ZiOD5zbKcNDplG7vz90ILDJbcdESl\nRYplkUgUX1nU937YNbpP4QPqnoEYZwQ9rUdbOEd2uqO3BdK5drRYJjr6R1IIAf7E\nAaEsLx94n9uVzPZPwEnrllY8RYXNuOLJhNY5U8Mr7QKBgQDq3DzzGoly+5I/WPSi\nLVEyWF11ZZ2gZKpUKyvA1y7kIYnVeTytzaSQMhQpL9CdJ2E3UPtYBABMHJ3PjRG3\nVheR6ub2LY/K1odfptPlVzGt2bvezo8pbN0pobA81KLTEJ8iYU8OYyU5G3lNkwk+\nLXCtg9Gb1Sm0H4t+2t4aPf4/vQKBgQDK3QjSiWjX4kATi3Wl4IEulRi5EM+Uy4M5\nkpNWrQi09a8n0IjYH0boGmylHXoSPKwsDzvInE43xoW90ODiMJpsmnCNtLoBPDVM\nmT7oKPJza7GxtlVdgwdvmGVmbxkOPt2+T5vAKDk3mLuGq/siDVr6vtbTv+AOrKkf\nEYAmqJS+IwKBgFb07lgwRh3diVuNCx6U2tBiKVBTLFZ7jxkU1uFSitkKlecFOXM8\nhaah9Bb/ziSxtOvvPvBqotWLbt6u45VW+ekb6SHS4r9+SKcgtKnga9Nrn4SyRA1Z\nclV8uSz8qcCuEc1/6+5uxRRs2K/hNfXgiyyjdtNUzFkVqOdyD/P1ahKdAoGAVnUr\nnGcZuuBfRLUsF9z90XeTyNPkVFsD+1Z/2vH2AwGue76Bg/KYirUwVpKggwM+saxw\nY0hSgaznNQW/wkbKmbyceZhrqbkaUiIB0HobEpv0aHP4H9mHIsWFecmhmROr977/\n9z5tXEeIrJXBezrL6o/JCQf+muJ1VZtkzZUNh5cCgYBveqvMdMLHCOj6ArDDzJat\nHaqXyOmLhvcySug6lhgqRzD3oiZA3dhh8EEEwXdHoGJOKm1ieBnfszz6y7RO1TQ0\n+315ssikJQQ2jGd4wfKq7GxLpi8BZyDzXvGAPUVNP/qvQDqcnlPpfsnuCvV6sokG\n+nab31g9oql7DbQJibLmjA==\n-----END PRIVATE KEY-----\n",
  "client_email": "tune-460@tune-664be.iam.gserviceaccount.com",
  "client_id": "115847386689875001789.apps.googleusercontent.com",
  "type": "service_account"
}
''');
    final scopes = [iap.AndroidPublisherApi.androidpublisherScope];
    auth.clientViaServiceAccount(accountCredentials, scopes).then((client) {
      var api = new iap.AndroidPublisherApi(client);
      var per = api.purchases.subscriptions.get('com.icw.cygnus.cygnus', verif.substring(0,idx).trim(), verif.substring(idx+1).trim());
      //  per.whenComplete(() => print(json.encode(per.toString())));
      per.then((value) =>
      {
        //print(json.encode(value.paymentState.toString()))
        pstate = value.paymentState.toString(),
      if(pstate=="null"){
          pstate2="Free Package"

          },
          if(pstate=="1"){
        if( verif.substring(0,idx).trim()=="tunesubscriptions"){
          pstate2="Bronze Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions1"){
          pstate2="Silver Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions2"){
          pstate2="Gold Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions3"){
          pstate2="Platinum Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions4"){
          pstate2="Loyalty Member Package"
        }
      }
      else{
      pstate2="Free Package"
      }
      }
      );
    });
  }

  Future<String> gettper(String? mid) async {
    String   resp="";
    await _userProvider!.getpay(mid!).then((response) {
      resp = response;

      return response;
    });

    return resp;
  }


  // var db = new DatabaseHelper(); // CALLS FUTURE
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
      //  setState(() {
      gettper(uid).then((data) {
        setState(() {
          verif = data;
          idx = verif.indexOf(":");
          checkpur();
        });
      });
      gett3().then((data) {
        //setState(() {

        gett(uid).then((data) {
          setState(() {
            planets = data;
            _userProvider?.getUser().then((value) {
              setState(() {
                user = value!;
               ptpref= user?.pt.toString();
                if(ptpref=='1' ){

                }
                else{
                  ptpref="1";
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => EditProfilePage(1,'Add your Partner Preference')),
                  );

                }
              });
            });



          });
        });
        gettb(uid).then((data) {
          setState(() {
            planetsb = data;
          });
        });
        gettm(uid).then((data) {
          setState(() {
            planetsm = data;
          });
        });
        gettr(uid).then((data) {
          setState(() {
            planetsrc = data;
          });
        });
        gettbl(uid).then((data) {
          setState(() {
            planetbl = data;
          });
        });
        gettreq(uid).then((data) {
          setState(() {
            planetsrq = data;
          });
        });
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
        getedu().then((data) {
          setState(() {
            edulis = data;
          });
        });
        getlan().then((data) {
          setState(() {
            langs = data;
             cityNames = langs.map((city) => city.name.toString()).toList();
            langst=langs.map((city) => city.name.toString()).toList();
          });
        });
        //});
        //});
      });
    });

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
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
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }


  Future<List<maril>> getlan() async {
    await _userProvider!.getlangs().then((response) {
      langs = response;

      return response;
    });

    return langs;
  }

  Future<List<maril>> getedu() async {
    await _userProvider!.getedul().then((response) {
      edulis = response;

      return response;
    });

    return edulis;
  }
  Future<List<maril>> getcurr() async {
    await _userProvider!.getcur().then((response) {
      curry = response;

      return response;
    });

    return curry;
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

  Future<List<Planet>> gettreq(String? mid) async {
    await _userProvider!.getuserlist2(mid!).then((response) {
      planetsrq = response;

      return response;
    });

    return planetsrq;
  }
  Future<List<Planet>> gettb(String? mid) async {
    await _userProvider!.getuserlistb(mid!).then((response) {
      planetsb = response;

      return response;
    });

    return planetsb;
  }
  Future<List<Planet>> gettm(String? mid) async {
    await _userProvider!.getuserlistm(mid!).then((response) {
      planetsm = response;

      return response;
    });

    return planetsm;
  }
  Future<List<Planet>> gettr(String? mid) async {
    await _userProvider!.getuserlistr(mid!).then((response) {
      planetsrc = response;

      return response;
    });

    return planetsrc;
  }
  Future<List<Planet>> gettbl(String? mid) async {
    await _userProvider!.getuserlistbl(mid!).then((response) {
      planetbl = response;

      return response;
    });

    return planetbl;
  }
  Future<AppUser?> gett3() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    if(shared_User!=null){
    user = parsePhotos(shared_User.getString('user')).first;
    }
    return user;
  }







  Widget Plane() {
    if( planets.isNotEmpty){
      return Scaffold(
        body:
        Column(
            children: <Widget>[
              if (_isBannerAdReady)
                Container(
                  width:_bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height-_bannerAd.size.height-94,
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
                              (context, index) => new PlanetRow(planets[index],notifyParent: refresh),
                          childCount: planets.length,
                        ),
                      ),
                    ),



                  ],
                ),




        ),

      ]),
      );
    }else{
      return Scaffold(
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

  Future<String?> gett2() async {
    uid = (await SharedPreferencesUtil.getUserId());
    // SharedPreferences shared_User = await SharedPreferences.getInstance();
    // user= parsePhotos(shared_User.getString('user')).first;
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      print('FlutterFire Messaging Example: Getting APNs token...');
      String? token = await FirebaseMessaging.instance.getAPNSToken();
      setToken(token);
      print('FlutterFire Messaging Example: Got APNs token: $token');
    } else {
      FirebaseMessaging.instance
          .getToken(
          vapidKey:
          'BIpYO-ZoiutWz_fJB6jBb4GNDaSe6r9lrhoUBLiD4PHzk6IjcgwJxIFYXC7j0B-FnNB7xpLl4J3QAZQ6bpiq-A4')
          .then(setToken);
      _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
      _tokenStream.listen(setToken);
    }


    await FirebaseMessaging.instance.subscribeToTopic('tune');
    return uid;
  }


  void setToken(String? token) {
    print('FCM Token: $token');
    setState(() {
      _token = token;
      settoken1(_token);
    });
  }
  Future<void> settoken1(String? mid) async {
    await _userProvider!.inserttoken(uid,mid!).then((response) {



    });


  }

  Future<List<Planet>> gett(String? mid) async {
    await _userProvider!.getuserlisth(mid!).then((response) {
      planets = response;

      return response;
    });

    return planets;
  }
  Future<void> setonline(String? mid,String? msg) async {
    await _userProvider?.updateonline(mid,msg??'').then((response) {

    });


  }

  Future<List<Planet>> gettf(String? mid) async {
    await _userProvider!.getuserlistf(mid!,marit,onbef,canUpload,reli,age,stateValue2,cityValue2,countryValue2).then((response) {
      planets = response;

      return response;
    });

    return planets;
  }
  showConfirmationDialog(BuildContext context) {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {

          //return CustomDialog();
          return scd();

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    if(widget.textInput==1){

      Future.delayed(Duration.zero, () {
        if(widget.textInput==1) {
          widget.textInput=2;
          showConfirmationDialog(context);

        }
      });


    }
if(remid!=''){
  setState(() {
    planets.removeWhere((item) => item.id == remid);
    remid='';
  });
}
    return Scaffold(

        key: _scaffoldKey,
        body:  CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Plane(),

    ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.search),
            backgroundColor:Colors.blueAccent,
            onPressed: (){



              showConfirmationDialog(context);

            }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

    );

  }
  refreshh() async {


    // setState(() {});
  }
  Widget scd(){
    return AlertDialog(
        elevation: 24,
        title: Text('Filter'),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {


   return    Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child:
              SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _texts.length,
                    itemBuilder: (_, index) {
                      return CheckboxListTile(
                        checkColor: Colors.red,
                        title: Text(_texts[index]),
                        value: _isChecked[index],
                        onChanged: (val) {
                          setState(() {
                            _isChecked[index] = val!;
                            canUpload = true;
                            for (var item in _isChecked) {
                              if (item == false) {
                                canUpload = false;
                              }
                            }
                          });
                        },
                      );
                    },
                  ),
                ]),
            ListTile(
              title:
              Text('Religion',style: TextStyle(color: Colors.blue),),
              subtitle: DropdownButton<String>(
                isDense: true,
                hint: new Text("Select"),
                value: reli,
                onChanged: (newValue) {

                  setState(() {
                    reli = newValue??'';
                  });

                  print (reli);
                },
                items: religions.map((rel map) {
                  return new DropdownMenuItem<String>(
                    value: map.name.toString(),
                    child: new Text(
                      map.name??'',
                    ),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title:
              Text('Marital Status',style: TextStyle(color: Colors.blue),),
              subtitle: DropdownButton<String>(
                isDense: true,
                hint: new Text("Select"),
                value: marit,
                onChanged: (newValue) {

                  setState(() {
                    marit = newValue??'';
                  });

                  print (marit);
                },
                items: marils.map((maril map) {
                  return new DropdownMenuItem<String>(
                    value: map.name.toString(),
                    child: new Text(
                      map.name??'',
                    ),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title:
              Text('Profile Created by',style: TextStyle(color: Colors.blue),),
              subtitle: DropdownButton<String>(
                isDense: true,
                hint: new Text("Select"),
                value: onbef,
                onChanged: (newValue) {

                  setState(() {
                    onbef = newValue??'';
                  });

                  print (onbef);
                },
                items: onbefs.map((maril map) {
                  return new DropdownMenuItem<String>(
                    value: map.name.toString(),
                    child: new Text(
                      map.name??'',
                    ),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title:
              Text('Education level',style: TextStyle(color: Colors.blue),),
              subtitle: DropdownButton<String>(
                isDense: true,
                hint: new Text("Select"),
                value: edu,
                onChanged: (newValue) {

                  setState(() {
                    edu = newValue??'';
                  });

                  print (edu);
                },
                items: edulis.map((maril map) {
                  return new DropdownMenuItem<String>(
                    value: map.name.toString(),
                    child: new Text(
                      map.name??'',
                    ),
                  );
                }).toList(),
              ),
            ),

            ListTile(
              title:
              Text(''),
              subtitle: DropdownButton<String>(
                  value: age,
                  onChanged: (String? newValue){
                    setState(() {  age=newValue!;});

                  },
                  items: [
                    'Age',
                    '16-25',
                    '26-35',
                    '36-45',
                    '46-55',
                    '56-65',


                  ]
                      .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value)
                    );
                  }).toList()
              ),
            ),

            //Genderfilter
            ListTile(
              title:
              Text("Country: "),
               subtitle:cntryp2(),
              // DropdownButton<String>(
              //     value: dist,
              //     onChanged: (String? newValue){
              //       setState(() {  dist=newValue!;});
              //     },
              //     items: [
              //       'District',
              //       'Ampara',
              //       ' Anuradhapura',
              //       'Badulla',
              //       'Batticaloa',
              //       'Colombo',
              //       ' Galle',
              //       ' Gampaha',
              //       ' Hambantota',
              //       ' Jaffna',
              //       ' Kalutara',
              //       ' Kandy',
              //       ' Kegalle',
              //       ' Kilinochchi',
              //       ' Kurunegala',
              //       ' Mannar',
              //       'Matale',
              //       'Matara',
              //       'Monaragala',
              //       'Mullaitivu',
              //       'Nuwara Eliya',
              //       'Polonnaruwa',
              //       'Puttalam',
              //       'Ratnapura',
              //       'Trincomalee',
              //       'Vavuniya',
              //
              //     ]
              //         .map<DropdownMenuItem<String>>((String value){
              //       return DropdownMenuItem<String> (
              //           value: value,
              //           child: Text(value)
              //       );
              //     }).toList()
              // ),
            ),
            ListTile(
              title:
              Text(" "),
              subtitle:DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    lanlist =x;
                  });
                },
                options: cityNames,
                selectedValues: lanlist,
                whenEmpty: 'Select Language',
              ),
            ),


          ],
        ),
              ),

   );
  }),

        actions: <Widget>[
    RoundedOutlinedButton(
    //child: Text('Okay'),
    onPressed: () {
      gett3().then((data) {
        //setState(() {

        gettf(user?.id).then((data) {
          setState(() {
            planets = data;

          });
        });
        //});
        //});
      });
      Navigator.of(context).pop();


    }, text: 'Search',
    ),
    ]

    );


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
