import 'dart:convert';

import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/db/entity/swipe.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/hook/scr/hookup.dart';
import 'package:cygnus/hook/scr/profiles.dart';
import 'package:cygnus/ui/screens/ViewProfilePage.dart';
import 'package:cygnus/ui/screens/chat_screen.dart';
import 'package:cygnus/ui/screens/matched_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsTab.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/util/CustomStack.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/hook/scr/draggable_card.dart';
import 'package:cygnus/hook/scr/matches.dart';
import 'package:cygnus/hook/scr/profile_card.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class CardStack extends StatefulWidget {
  final MatchEngine matchEngine;

  CardStack({Key? key, required this.matchEngine});
  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>  {
  late Key _frontCard;
  late DateMatch _currentMatch;
  double _nextCardScale = 0.9;
   SlideRegion? slideRegion;
  List<String?> _ignoreSwipeIds=<String>[];
  UserProvider? _userProvider;
  bool _isLoading = false;
  AppUser? user;
   Future<AppUser?>? appUser;
  LanguageChangeProvider? appLanguage ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.matchEngine.addListener(_onMatchEngineChange);
    _currentMatch = widget.matchEngine.currentMatch;
    _currentMatch.addListener(_onMatchChange);
    _frontCard = new Key(_currentMatch.profile.name);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    user=widget.matchEngine.user;


  }



  @override
  void dispose() {
    // TODO: implement dispose
    if (_currentMatch != null) {
      _currentMatch.removeListener(_onMatchChange);
    }
    widget.matchEngine.removeListener(_onMatchEngineChange);

    super.dispose();
  }
  // @override
  // void didPush() {
  //
  //       // Route was pushed onto navigator and is now topmost route.
  // }
  //
  // @override
  // void didPushNext() {
  //   // Covering route was popped off the navigator.
  // }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // routeObserver is the global variable we created before
  //   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  // }


  @override
  void didUpdateWidget(CardStack oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.matchEngine != oldWidget.matchEngine) {
      oldWidget.matchEngine.removeListener(_onMatchEngineChange);
      widget.matchEngine.addListener(_onMatchEngineChange);
    }
    if (_currentMatch != null) {
      _currentMatch.removeListener(_onMatchChange);
    }
    _currentMatch = widget.matchEngine.currentMatch;
    if (_currentMatch != null) {
      _currentMatch.addListener(_onMatchChange);
    }
  }

  void _onMatchEngineChange() {

    setState(() {
      if (_currentMatch != null) {
        _currentMatch.removeListener(_onMatchChange);
      }
      _currentMatch = widget.matchEngine.currentMatch;
      if (_currentMatch != null) {
        _currentMatch.addListener(_onMatchChange);
      }
      _frontCard = new Key(_currentMatch.profile.name);
    });

  }

  void _onMatchChange() {
    // setState(() {
    //   //matcifh has been changed
    //   if(widget.matchEngine.currentMatch==_currentMatch)
    //   {
    //
    //
    //   }
    //
    // });
  }

  Widget _buildFrontCard() {
    return new ProfileCard(
        key: _frontCard,
        profile: widget.matchEngine.currentMatch.profile,
        decision: widget.matchEngine.currentMatch.decision,
        region: slideRegion);
  }

  Widget _buildBackCard({bool isDraggable: false}) {
    return new Transform(
      transform: new Matrix4.identity()..scale(_nextCardScale, _nextCardScale),
      alignment: Alignment.center,
      child: new ProfileCard(
          profile: widget.matchEngine.nextMatch.profile,
          decision: widget.matchEngine.nextMatch.decision,
          region: slideRegion,
          isDraggable: false),
    );
  }

  void _onSlideUpdate(double distance) {

    setState(() {
      // _nextCardScale = 0.9 + (0.1 * (distance / 100.0).clamp(0.0, 0.1));
      _nextCardScale = 0.9 + (0.1 * (distance / 100.0)).clamp(0.0, 0.1);
    });

  }

  void _onSlideRegion(SlideRegion region) {

      setState(() {
        slideRegion = region;
      });

  }
  void _onSlideOutComplete(SlideDirection direction) {
    DateMatch currentMatch = widget.matchEngine.currentMatch;
    switch (direction) {
      case SlideDirection.left:
        currentMatch.nope();
        personSwiped(
            widget.matchEngine.currentMatch.user,
            widget.matchEngine.currentMatch.profile,
            false);
        break;
      case SlideDirection.right:
        currentMatch.like();
        personSwiped(
            widget.matchEngine.currentMatch.user,
            widget.matchEngine.currentMatch.profile,
            true);
        break;
      case SlideDirection.up:
        currentMatch.like();
        personbooked(
            widget.matchEngine.currentMatch.user,
            widget.matchEngine.currentMatch.profile,
            true);
        break;
      case SlideDirection.mid:
        currentMatch.nope();
        // Navigator.pushNamed(context, ViewProfilePage.id,arguments: {"name" :
        // widget.matchEngine.currentMatch.user!.id});
        Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => ViewProfilePage(uidnew:widget.matchEngine.currentMatch.user!.id),));


        break;
    }
    // Navigator
    //     .of(context)
    //     .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  TopNavigationScreen()));

    widget.matchEngine.cycleMatch();
  }



  SlideDirection _desiredSlideOutDirection() {
    switch (widget.matchEngine.currentMatch.decision) {
      case Decision.nope:
        return SlideDirection.left;
      case Decision.like:
        return SlideDirection.right;
      case Decision.superLike:
        return SlideDirection.up;
      default:
             return SlideDirection.up;

    }
  }



  @override
  Widget build(BuildContext context) {
    return
      CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        child:
      new Stack(
      children: <Widget>[


        // Positioned(
        //   bottom: 0,
        //   right: 0,height: 20,
        //   child: IconButton(
        //     color:  Colors.pink,
        //     onPressed: () {
        //         sendMessagePressed(context);
        //     },
        //     icon: Icon(Icons.info),
        //   ),
        // ),

          new DraggableCard(isDraggable: false,
            card: _buildBackCard(),
            onSlideOutComplete: _onSlideOutComplete,
            onSlideRegionUpdate: _onSlideRegion,),

          new DraggableCard(
              card: _buildFrontCard(),
              slideTo: _desiredSlideOutDirection(),
              onSlideUpdate: _onSlideUpdate,
              onSlideRegionUpdate: _onSlideRegion,
              onSlideOutComplete: _onSlideOutComplete),

      ],
      ), );
  }
  void sendMessagePressed(BuildContext context)  {
    if(widget.matchEngine.currentMatch.user!=null) {

      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) =>
          ViewProfilePage(uidnew: widget.matchEngine.currentMatch.profile.id)));

    }
  }
  void personSwiped(AppUser? myUser, Profile? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
    _isLoading = true;
    await _userProvider!
        .insertswip(myUser.id,otherUser.id,isLiked.toString())
        .then((response) {
      if(response!=null){
        // _isLoading = false;

      }
    });

    //  _isLoading = false;
    _ignoreSwipeIds.add(otherUser.id);

    if (isLiked == true) {
      if (await isMatch(myUser, otherUser) == true) {
        //  _databaseSource.addMatch(myUser.id, Match(otherUser.id));

        await _userProvider!
            .insertmatch(myUser.id,otherUser.id)
            .then((response) {
          if(response!=null){
            //  _isLoading = false;

          }
        });
        await _userProvider!
            .insertmatch(otherUser.id,myUser.id)
            .then((response) {
          if(response!=null){

            //  _isLoading = false;
          }
        });
        // _databaseSource.addMatch(otherUser.id, Match(myUser.id));
        String chatId = compareAndCombineIds(myUser.id, otherUser.id);
         //  _databaseSource.addChat(Chat(chatId, null));
        await _userProvider!
            .addchat(chatId,myUser.id,otherUser.id)
            .then((response) {
          if(response!=null){

            //  _isLoading = false;
          }
        });

        // _isLoading = false;
       // _currentMatch.removeListener(_onMatchChange);

      //  Navigator.pop(context);

        //
        // Navigator.of(context)
        //     .push(MaterialPageRoute (
        //   builder: (BuildContext context) =>  MatchedScreen(otherUserProfilePhotoPath:  otherUser.photos[0], otherUserId: otherUser.id, myUserId: myUser.id, myProfilePhotoPath: myUser.profilePhotoPath,),
        // ),);


        Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  MatchedScreen(otherUserProfilePhotoPath:  otherUser.photos[0], otherUserId: otherUser.id, myUserId: myUser.id, myProfilePhotoPath: myUser.profilePhotoPath,),));

        // Navigator.pushNamed(context, MatchedScreen.id, arguments: {
        //   "my_user_id": myUser.id,
        //   "my_profile_photo_path": myUser.profilePhotoPath,
        //   "other_user_profile_photo_path": otherUser.photos[0],
        //   "other_user_id": otherUser.id
        // });
      }
    }
    else {
      // _isLoading = false;
      // appUser=  loadPerson(user.id);


    }}
    else{
      showSnackBar(context, 'failed!');

    }
    _isLoading = false;
   // setState(() {});  //remove1
  }

  void personbooked(AppUser? myUser, Profile? otherUser, bool isLiked) async {
    //_databaseSource.addSwipedUser(myUser!.id, swip(otherUser!.id, isLiked));
    if (myUser!=null&&otherUser!=null) {
      _isLoading = true;
      await _userProvider!
          .insertbook(myUser.id,otherUser.id,isLiked.toString())
          .then((response) {
        if(response!=null){
          // _isLoading = false;

        }
      });

      //  _isLoading = false;
      _ignoreSwipeIds.add(otherUser.id);

     }
    else{
      showSnackBar(context, 'failed!');

    }
    _isLoading = false;
    // setState(() {});  //remove1
  }


  Future<bool> isMatch(AppUser myUser, Profile otherUser) async {
    // DocumentSnapshot swipeSnapshot =
    //     await _databaseSource.getSwipe(otherUser.id, myUser.id);
   bool er=false;
    _isLoading = true;
    // swip swipe = Swipe.fromSnapshot(swipeSnapshot);
    await _userProvider!
        .getswipid(otherUser.id, myUser.id)
        .then((response) {
      if(response==null){

        //showSnackBar(context, 'failed!');
        er=false;
        return er;
        _isLoading = false;
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
    _isLoading = false;

   return er;




  }



}
