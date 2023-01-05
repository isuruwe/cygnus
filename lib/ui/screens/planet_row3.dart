import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/db/entity/app_user.dart';
import '../../data/db/entity/swipe.dart';
import '../../data/model/planets.dart';
import '../../data/provider/user_provider.dart';
import '../../util/constants.dart';
import '../../util/utils.dart';
import '../pkg.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_outlined_button.dart';
import 'ViewProfilePage.dart';
import 'ViewProfilePage2.dart';
import 'chat_screen.dart';
import 'matched_screen.dart';

class planet_row3 extends StatelessWidget {
  final Planet planet;
  AppUser? user;
  UserProvider? _userProvider;
  final Function() notifyParent;
  planet_row3(this.planet, { required this.notifyParent});



  List<AppUser> parsePhotos(String? responseBody) {
    List<AppUser> rty=[AppUser(profilePhotoPath: '')];
    if(responseBody!=null) {
      final   parsed  = jsonDecode(responseBody).cast<
          Map<String, dynamic>>();
      return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
    }else{
      return rty;

    }

  }





  void personSwiped(String? myUser,  String? otherUser, bool isLiked,BuildContext context) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    if (myUser!=null&&otherUser!=null) {
     // _isLoading = true;
      await _userProvider!
          .insertswip(myUser,otherUser,isLiked.toString())
          .then((response) {
        if(response!=null){
          // _isLoading = false;

        }
      });
      // await _userProvider!.getuserlistr(myUser).then((response) {
      //   planetsrc = response;
      //
      //
      // });
      //  _isLoading = false;
    //  _ignoreSwipeIds.add(otherUser);

      if (isLiked == true) {
        await _userProvider!
            .sendmsg(otherUser,'You  have a new match!')
            .then((response) {
          if(response!=null){
            // _isLoading = false;

          }
        });

        if (await isMatch(myUser, otherUser) == true) {
          //  _databaseSource.addMatch(myUser.id, Match(otherUser.id));

          await _userProvider!
              .insertmatch(myUser,otherUser)
              .then((response) {
            if(response!=null){
              //  _isLoading = false;

            }
          });
          await _userProvider!
              .sendmsg(otherUser,'You  have a new match!')
              .then((response) {
            if(response!=null){
              // _isLoading = false;

            }
          });

          await _userProvider!
              .insertmatch(otherUser,myUser)
              .then((response) {
            if(response!=null){

              //  _isLoading = false;
            }
          });
          // _databaseSource.addMatch(otherUser.id, Match(myUser.id));
          String chatId = compareAndCombineIds(myUser, otherUser);
          //  _databaseSource.addChat(Chat(chatId, null));
          await _userProvider!
              .addchat(chatId,myUser,otherUser)
              .then((response) {
            if(response!=null){

              //  _isLoading = false;
            }
          });



          Navigator
              .of(context)
              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  MatchedScreen(otherUserProfilePhotoPath:  imgpath+planet.image[0].toString(), otherUserId: otherUser, myUserId: myUser, myProfilePhotoPath: user?.profilePhotoPath??'',),));


        }
        else{
         notifyParent();
          showSnackBar(context, 'Accepted!');
        }
      }
      else {
        // _isLoading = false;
        // appUser=  loadPerson(user.id);


      }}
    else{
      showSnackBar(context, 'failed!');

    }
   // _isLoading = false;
      //remove1
  }

  Future<bool> isMatch(String? myUser,  String? otherUser) async {
    // DocumentSnapshot swipeSnapshot =
    //     await _databaseSource.getSwipe(otherUser.id, myUser.id);
    bool er=false;
   // _isLoading = true;
    // swip swipe = Swipe.fromSnapshot(swipeSnapshot);
    await _userProvider!
        .getswipid(otherUser, myUser)
        .then((response) {
      if(response==null){

        //showSnackBar(context, 'failed!');
        er=false;
        return er;
      //  _isLoading = false;
      }
      else{
        final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
        List<swip> swipes =parsed.map<swip>((json) => swip.fromJson(json)).toList();
        //var swipes =response;
        if(swipes.length>0) {
          if (swipes.first.liked == "1") {
            //_isLoading = false;
            er=true;
            return er;
          }
          else{
            // _isLoading = false;

            er=false;
            return er;

          }}
      }
    });
    //_isLoading = false;

    return er;




  }




  @override
  Widget build(BuildContext context) {
    double ht=0;
    double stht=0;
    double stht2=0;
    bool cansend=false;
    bool canpdsr=false;
    bool canmaxpr=false;
    bool canarpm=false;
    int arpm2=0;
    String plq= planet.req;
    (plq!='Accepted'||plq!='Rejected')&& plq!='Accepted'&&plq!='Rejected'? 0 <= int.parse(plq) && int.parse(plq) <=7?ht=260:ht=200:ht=200;
    plq=='Accepted'?ht=240:ht=200;
    planet.req=='Accepted'?stht=45:stht=0;

    planet.req=='Accepted'?stht2=55:stht2=45;
    planet.req=='Rejected'?stht2=45:planet.req=='Accepted'?stht2=100:stht2=stht2;

    (plq!='Accepted'&&plq!='Rejected'&& (0 <= int.parse(plq) && int.parse(plq) <=7))?ht=240:ht=ht;
    (plq!='Accepted'&&plq!='Rejected'&& (0 <= int.parse(plq) && int.parse(plq) <=7))?stht=45:stht=stht;
    (plq!='Accepted'&&plq!='Rejected'&& (0 <= int.parse(plq) && int.parse(plq) <=7))?stht2=100:stht2=stht2;
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
    final stc= new Container(
      height: 25,
      width:  MediaQuery.of(context).size.width-50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 0,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color:plq=='Accepted'? Color.fromRGBO(4, 201, 0, 0.6):plq=='Rejected'?Color.fromRGBO(245, 37, 37, 0.6): plq!='Accepted'&&plq!='Rejected'?0 <= int.parse(plq) && int.parse(plq) <=7?Color.fromRGBO(247, 148, 0, 0.6):Color.fromRGBO(169, 171, 169, 0.6):Color.fromRGBO(169, 171, 169, 0.6),
      ),

      child:  Center(child:Text(plq=='Accepted'?'Accepted':''+plq=='Rejected'?'Rejected':''+plq!='Accepted'&&plq!='Rejected'?0 <= int.parse(plq) && int.parse(plq) <=7?plq+' Days Remaining':'Request Expired':'',style: TextStyle(color: Colors.white,fontSize: 18)) ,),

    );
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
          //new Text(planet.cntry, style: headerTextStyle),
          new Row(children: [new Text(planet.cntry, style: headerTextStyle),SizedBox(width: 5,),
            planet.cncode!=''&&planet.cncode!='LK'?   new Flag.fromString(planet.cncode, height: 20, width: 20):Container(child:Image(image: new AssetImage('assets/images/lk.png'),height:20,width: 30,)  )],) ,
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 128.0,
              color: new Color(0xffeb4034)),
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
                      value: 'You Match To Partner: '+planet.gravity.replaceFirst(RegExp(r"\.[^]*"), "")+'%', image: 'assets/images/reddot.png')),


            ],
          ),


        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 230.0,
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
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => ViewProfilePage2(uidnew: planet.id,notifyParent1: notifyParent,))),
        child:

        new Container(
          height: ht,
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
             (plq!='Accepted'&&plq!='Rejected')?  0 <= int.parse(plq) && int.parse(plq) <=7?    Positioned(
                  bottom: 0,
                  width: 170,
                  left: 0,
                  child:
                  OutlinedButton(
                    onPressed: ()=> {

                      if(pstate2=='Free Package'||pstate2==''){



             if(planet.arpm!=null){
              arpm2= int.parse(planet.arpm.toString()) ,
             if(arpm2<2){
             cansend=true,
             canarpm=true,
             }

             }

             },
                 if(pstate2=='Bronze Package'){


          if(planet.arpm!=null){
       arpm2= int.parse(planet.arpm.toString()) ,
      if(arpm2<4){
        cansend=true,
        canarpm=true,
      }

    }

  },
    if(pstate2=='Silver Package'){


    if(planet.arpm!=null){
     arpm2= int.parse(planet.arpm.toString()) ,
    if(arpm2<6){
    cansend=true,
    canarpm=true,
    }

    }

    },
    if(pstate2=='Gold Package'){


    if(planet.arpm!=null){
     arpm2= int.parse(planet.arpm.toString()) ,
    if(arpm2<15){
    cansend=true,
    canarpm=true,
    }

    }

    },
    if(pstate2=='Platinum Package'){


    if(planet.arpm!=null){
     arpm2= int.parse(planet.arpm.toString()) ,
    if(arpm2<25){
    cansend=true,
    canarpm=true,
    }

    }

    },
    if(pstate2=='Loyalty Member Package'){


    if(planet.arpm!=null){
     arpm2= int.parse(planet.arpm.toString()) ,
    if(arpm2<50){
    cansend=true,
    canarpm=true,
    }

    }

    },
    if(cansend==true&&canarpm==true) {
    gett().then((data) {

    this.user = data;
    personSwiped(planet.id,user?.id,true,context);

    })
    }
    else{


    if(canarpm==false){
              showDialog(
    context: context,
    builder: (BuildContext context) {
    return   AlertDialog(
    title: Text('Notification'),
    content: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    ],
    ),
    actions: [
    Text('Your accepted requests count received by you within a month of period are over. Please upgrade or buy a package!')
    ,
    SizedBox(height: 20,),
    RoundedButton(
    onPressed: () {
      Navigator
          .of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) => pkg()));
    },
    text: 'Upgrade',
    ),
    RoundedButton(
    onPressed: () {
    Navigator.of(context).pop();
    },
    text: 'Cancel',
    ),

    ],
    );
    }),

    }
    }
                   ////////////////////

                    },
                    style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(4, 201, 0, 0.6),),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Accept",style: TextStyle(color: Colors.white,fontSize: 18),),
                  )
                  // RoundedOutlinedButton(
                  //   onPressed: () {
                  //     //sendMessagePressed(context);
                  //
                  //     gett().then((data) {
                  //
                  //       this.user = data;
                  //       personSwiped(planet.id,user?.id,true,context);
                  //
                  //     });
                  //   },
                  //   text: 'Accept',
                  // )
              ):Container():Container(),
              (plq!='Accepted'&&plq!='Rejected')? 0 <= int.parse(plq) && int.parse(plq) <=7?     Positioned(
                  bottom: 0,
                  width: 170,
                  right: 0,
                  child:
                  OutlinedButton(
                    onPressed: ()=> {gett().then((data) {

                    this.user = data;
                    personblock(planet.id,user?.id,'2',context);
                    })},
                    style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(4, 201, 0, 0.6),),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Reject",style: TextStyle(color: Colors.white,fontSize: 18),),
                  )

                  // RoundedOutlinedButton(
                  //   onPressed: () {
                  //     gett().then((data) {
                  //
                  //       this.user = data;
                  //       personblock(planet.id,user?.id,'2',context);
                  //     });
                  //
                  //
                  //
                  //   },
                  //   text: 'Reject',
                  // )
              ):Container():Container(),
              plq=='Accepted'?    Positioned(
                  bottom: 0,
                  width: 170,
                  left: 0,
                  child:  OutlinedButton(
                    onPressed: () {
                      sendMessagePressed(context);


                    },  style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(4, 201, 0, 0.6),),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                  ),
                    child: const Text("Chat",style: TextStyle(color: Colors.white,fontSize: 18),),
                  )
              ):Container(),
              plq=='Accepted'?     Positioned(
                  bottom: 0,
                  width: 170,
                  right: 0,
                  child:  OutlinedButton(
                    onPressed: () {
                      gett().then((data) {

                        this.user = data;

                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return    AlertDialog(
                              title: Text("Congratulations"),
                              content:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("We are happy to inform you that you both are agreed to share your contacts numbers")
                                    ,Text("")
                                    , Text("You must acknowledge that it is your responsibility to find the true falsehood of all the information provided by him or her before starting a relationship through this app.")
                                    ,  new Container(
                                      child:user!.profilePhotoPath.isNotEmpty ? GestureDetector(
                                        child: Hero(
                                          tag: 'imageHero',
                                          child: CachedNetworkImage(
                                            imageUrl: user!.profilePhotoPath,
                                            imageBuilder: (context, imageProvider) => Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider, fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                        onTap: () {

                                        },
                                      ) :Container(),
                                    ),
                                    Text(user?.pn??''),
                                    new Container(
                                      child:planet.image.isNotEmpty ? GestureDetector(
                                        child: Hero(
                                          tag: 'imageHero',
                                          child: CachedNetworkImage(
                                            imageUrl:  imgpath+planet.image[0],
                                            imageBuilder: (context, imageProvider) => Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider, fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                        onTap: () {

                                        },
                                      ) :Container(),
                                    ),Text(planet.pn),
                                  ],
                                ),),
                              actions: [
                                RoundedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: 'OK',
                                ),
                              ],
                            );
                          });


                    },
                    style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(4, 201, 0, 0.6),),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                     child: const Text("View Mobile",style: TextStyle(color: Colors.white,fontSize: 18),),
                  )
              ):Container(),
              Positioned(
                bottom: stht2,

                child:      planetThumbnail,
              ),

              Positioned(
                bottom: stht,
                height: 30,
                child:       stc,
              ),
              Positioned(
                  top: 0,
                  left: 0,

                  child:  new Container(
                      child:
                      _planetValue2(
                          value:  planet.lo!=''?planet.lo+' ago':'', image: 'assets/images/clock.png')),
              ),
            ],
          ),),);


  }


  Future<AppUser?> gett() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user')).first;
    return user;
  }

  void personblock(String? myUser,  String? otherUser,  String? st,BuildContext context) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      //_isLoading = true;
      _userProvider = Provider.of<UserProvider>(context, listen: false);
      await _userProvider!
          .sendmsg(otherUser,'Your request rejected by a user!')
          .then((response) {
        if(response!=null){
          // _isLoading = false;

        } });
      await _userProvider
          ?.insertreject(myUser, otherUser,st)
          .then((response) {
        if (response != null) {
          // _isLoading = false;
notifyParent();
        }
      });
    }

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
