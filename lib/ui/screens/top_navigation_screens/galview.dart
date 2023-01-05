import 'dart:convert';

import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/register_sub_screens/add_photo_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/addmedia.dart';
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
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../top_navigation_screen.dart';
import 'SettingsPage.dart';
import 'SettingsTab.dart';
import 'package:http/http.dart' as http;

import 'UpdatePhoto.dart';



class galview extends StatefulWidget {
  static const String id = 'EditProfilePage';

  @override
  _galview createState() => _galview();
}

class _galview extends State<galview> {
  bool showPassword = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider;

  String? uid="";
late  userdet userdet1;
  AppUser? user;
  bool _isLoading=false;
  String _platformVersion = 'Unknown';
   late var imageList =[];
  RangeValues _currentRangeValues = const RangeValues(16, 60);

  @override
  void initState()  {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
      setState(() {

        gett(uid).then((data) {
          setState(() {

          });
        });


      });
    });
  }
  Future<String?> gett2() async {


    uid= (await SharedPreferencesUtil.getUserId());
    // SharedPreferences shared_User = await SharedPreferences.getInstance();
    // user= parsePhotos(shared_User.getString('user')).first;
    return uid;
  }
  Future<userdet?> gett(String? mid) async {

    await _userProvider!
        .getUsermedia(mid!)
        .then((response) {
      imageList=response;
      return response;
    });


  }


  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }


  @override
  Widget build(BuildContext context) {
    if(imageList.isNotEmpty){
      return DefaultTabController(
        length: 2,
        child:
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,

          ),
          child:
          Padding(
            padding: kDefaultPadding,
            child: Scaffold(
              key: _scaffoldKey,
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
                  // Text('Add', style: TextStyle(fontSize: 20.0, color: Colors.green),),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, addmedia.id,arguments: {"name" :
                      uid});
                    },
                  ),
                ],
              ),
              body:PhotoViewGallery.builder(
                itemCount: imageList.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(imageList[index].sponsorlogo),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
                loadingBuilder:
                    (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded / event.expectedTotalBytes!.bitLength,
                    ),
                  ),
                ),

              ),

    ),
    ),
        ), );
    }
    else{
      return CustomModalProgressHUD(
        inAsyncCall: true,
        child:
        DefaultTabController(
          length: 2,
          child:
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
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, addmedia.id,arguments: {"name" :
                        uid});
                      },
                    ),
                  ],
                ),
                body:

               Container(),
              ),
            ),
          ),
        ),
      );}
  }







}
List<dynamic> payloadFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => Payload.fromJson(x)));

String payloadToJson(List<Payload> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payload {
  String? sponsorlogo;

  Payload({
    required this.sponsorlogo,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    sponsorlogo: json["file_original_name"] == null ? null : imgpath+json["file_original_name"],
  );

  Map<String, dynamic> toJson() => {
    "file_original_name": sponsorlogo == null ? null : sponsorlogo,
  };
}