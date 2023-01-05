import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/planets.dart';
import '../../util/constants.dart';
import '../../util/utils.dart';
import 'ViewProfilePage.dart';
import 'ViewProfilePage2.dart';
import 'chat_screen.dart';

class PlanetRowb extends StatelessWidget {
  final Planet planet;
  final Function() notifyParent;
  UserProvider? _userProvider;
  AppUser? user;
  PlanetRowb(this.planet,{ required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett3().then((data) {
      //setState(() {


    });

    final planetThumbnail =new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      alignment: FractionalOffset.centerLeft,
      child:
      // new Image(
      //   image: new AssetImage(planet.image[0]),
      //   height: 92.0,
      //   width: 92.0,
      // ),
      Container(
        child: Stack(children: <Widget>[
       CachedNetworkImage(
      imageUrl:  imgpath+planet.image[0],
      imageBuilder: (context, imageProvider) => Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),planet.verified=='1'?  Positioned(
      top: 0,
      left: 0,
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
            color: Colors.blue,
          ),
          child:
          Icon(
            Icons.verified,
            color: Colors.white,
          ),
        ),

    ):SizedBox(height:10 ,),
],),),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black, //const Color(0xffb6b2df),
        fontSize: 15.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0, fontWeight: FontWeight.w900,
      color: Colors.redAccent,
    );
    final subHeaderTextStyle2 = regularTextStyle.copyWith(
      fontSize: 12.0, fontWeight: FontWeight.w900,
      color: Colors.black,
    );
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _planetValue({required String value, required String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0), //.asset(image, height: 12.0),
        new Container(width: 1.0),
        new Text(value, style: regularTextStyle),
      ]);
    }
    Widget _planetValue2({required String value, required String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0), //.asset(image, height: 12.0),
        new Container(width: 1.0),
        new Text(value, style: subHeaderTextStyle),
      ]);
    }
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Container(height: 1.0),


      Flexible(
        child: new Container(
          padding: new EdgeInsets.only(right: 13.0),
          child:
          new Text(planet.name, style: headerTextStyle),),),



          new Container(height: 1.0),
          new Text(planet.location, style: subHeaderTextStyle2),
        new Row(children: [new Text(planet.cntry, style: headerTextStyle),SizedBox(width: 5,),
          planet.cncode!=''&&planet.cncode!='LK'?   new Flag.fromString(planet.cncode, height: 20, width: 20):Container(child:Image(image: new AssetImage('assets/images/lk.png'),height:20,width: 30,)  )],) ,
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 128.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: 'Age: '+planet.distance,
                      image: 'assets/images/tme.png')),
              // new Expanded(
              //     child: _planetValue(
              //         value: planet.lo+' ago', image: 'assets/images/info.png'))
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: 'Partner Match To You: '+planet.matcho.replaceFirst(RegExp(r"\.[^]*"), "")+'%', image: 'assets/images/reddot.png')),

            ],
          ),
          new Row(
            children: <Widget>[

              new Expanded(
                  child: _planetValue(
                      value: 'You Match To Partner: '+planet.gravity.replaceFirst(RegExp(r"\.[^]*"), "")+'%', image: 'assets/images/reddot.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 160.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color:Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        // boxShadow: <BoxShadow>[
        //   new BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10.0,
        //     offset: new Offset(0.0, 10.0),
        //   ),
        // ],
      ),
    );

    return
      new GestureDetector(
        onTap:
        // () =>        Navigator
        //     .of(context)
        //     .push(new MaterialPageRoute(builder: (BuildContext context) => ViewProfilePage(uidnew:planet.id),))
    () =>
        // Navigator.push(
        //     context, new MaterialPageRoute(builder: (context) => ViewProfilePage2(uidnew: planet.id,notifyParent1: refresh))
        //
        //
        // )
        {
          showDialog(
            //barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {

              return AlertDialog(
                title: Text('Are sure you want to unblock this user?'),
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        unlockperson(user?.id,planet.id,context);
                      },
                      child: Text("OK")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel")),
                ],
              );

            },
          ),
        }
        ,
    child:

      new Container(
        height: 160.0,
        decoration: new BoxDecoration(
          color: new  Color(0xFFfafafa),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[

            planetCard,
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: IconButton(
            //     onPressed: () {
            //       sendMessagePressed(context);
            //     },
            //     icon: Icon(Icons.favorite),
            //     color: Colors.white,
            //   ),
            // ),

            planetThumbnail,
            Positioned(
              top: 2,
              left: 0,
                child:  new Container(
                    child:
                    _planetValue2(
                        value:  planet.lo!=''?planet.lo+' ago':'', image: 'assets/images/clock.png')),
            ),
          ],
        ),),);


  }
  refresh()  {
    notifyParent();
  }
  void unlockperson(String? myUser,  String? otherUser,BuildContext cxt) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {

      await _userProvider!
          .removeblock(myUser,otherUser)
          .then((response) {
        if(response!=null){
          // _isLoading = false;
          Navigator.of(cxt).pop();Navigator.of(cxt).pop();
        }
      });



     }
    else{
      //showSnackBar(context, 'failed!');

    }

    // setState(() {});  //remove1
  }
  Future<AppUser?> gett3() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    if(shared_User!=null){
      user = parsePhotos(shared_User.getString('user')).first;
    }
    return user;
  }
  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }
  void sendMessagePressed(BuildContext context) async {
    // AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;
    var uid= (await SharedPreferencesUtil.getUserId());
    if(uid!=null) {
      Navigator.pop(context);
      Navigator.pushNamed(context, ChatScreen.id, arguments: {
        "chat_id": compareAndCombineIds(uid, planet.id),
        "user_id": uid,
        "other_user_id": planet.id
      });
    }
  }

}
