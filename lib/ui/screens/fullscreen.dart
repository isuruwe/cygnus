import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/ui/widgets/image_portrait.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fullscreen extends StatefulWidget {




  @override
  _fullscreen createState() => _fullscreen();
}

class _fullscreen extends State<fullscreen> {



  AppUser? user;

  @override
  void initState()  {
    // TODO: implement initState

    super.initState();

    gett().then((data) {
      setState(() {
        this.user = data;
      });
    });

  }

  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody!).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  Future<AppUser?> gett() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return user;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: CachedNetworkImage(
              imageUrl:  user?.profilePhotoPath??'',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
