import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/hook/scr/hookup.dart';
import 'package:cygnus/main.dart';
import 'package:cygnus/ui/screens/ViewProfilePage.dart';
import 'package:cygnus/ui/screens/home.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/match_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/chats_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsTab.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../fcm/message.dart';
import '../../util/shared_preferences_utils.dart';
import '../widgets/NavBar.dart';
import 'fav.dart';


class TopNavigationScreen  extends StatefulWidget {
  static const String id = 'top_navigation_screen';
  int currentPage = 1;
  int hPage = 0;
  int fPage = 0;
  TopNavigationScreen(this.currentPage,this.hPage,this.fPage);
  @override
  _IndexState createState() => _IndexState();


}

class _IndexState extends State<TopNavigationScreen > {
  late PageController _pageController;

  UserProvider? _userProvider;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.currentPage, keepPage: false);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          '/message',
          arguments: MessageArguments(message, true),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
color: Colors.red,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'imageedit',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        '/message',
        arguments: MessageArguments(message, true),
      );
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildHookUpAppBar() as PreferredSizeWidget?,
      drawer: NavBar(),
      body: _buildTabsLayout(),
    );
  }
  void nextPage1(int pg){
    // _pageController.animateToPage(pg,
    //     duration: Duration(milliseconds: 400),
    //     curve: Curves.easeIn
    // );
    if (_pageController.hasClients)
      _pageController.jumpToPage(widget.currentPage);
  }

  @override
  void didUpdateWidget(TopNavigationScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    nextPage1(widget.currentPage);
    // if (widget.currentPage != oldWidget.currentPage) {
    //   setState(() {
    //     _pageController.jumpToPage(widget.currentPage);
    //   });
    // }
  }
  Widget _buildTabsLayout() {

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: _onPageChange,
      children: <Widget>[
        new SettingsTab(),
        new home(widget.hPage),
        new ChatsScreen(),
        new fav(widget.fPage),
        new ViewProfilePage(uidnew: ''),

      ],
    );

  }

  Widget _buildHookUpAppBar() {
    return new PreferredSize(
        child: new SafeArea(
          child: new Container(
            //margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Center(
                    child:Image.asset(
                      'assets/images/menu.png',
                      color: widget.currentPage == 2 ? Colors.pink : Colors.grey,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ),
                _buildTabItem(
                    position: 0,
                    widget: new AnimatedContainer(
                        child: Icon(
                          FontAwesomeIcons.solidUserCircle,
                          size: 30.0,
                          color: widget.currentPage == 0 ? Colors.pink : Colors.grey,
                        ),
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn)),
                _buildTabItem(
                    position: 1,
                    widget: new AnimatedContainer(
                        child: Icon(
                          FontAwesomeIcons.home,
                          size: 30.0,
                          color: widget.currentPage == 1 ? Colors.pink : Colors.grey,
                        ),
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn)),
                _buildTabItem(
                    position: 2,
                    widget: Image.asset(
                      'assets/images/ic_chat.png',
                      color: widget.currentPage == 2 ? Colors.pink : Colors.grey,
                      height: 30.0,
                      width: 30.0,
                    )),
                _buildTabItem(
                    position: 3,
                    widget: new AnimatedContainer(
                        child: Icon(
                          FontAwesomeIcons.bookmark,
                          size: 30.0,
                          color: widget.currentPage == 3 ? Colors.pink : Colors.grey,
                        ),
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn)),



              ],
            ),
          ),
        ),
        preferredSize: new Size.fromHeight(60.0));
  }

  Widget _buildTabItem({Widget? widget, int? position}) {
    return new GestureDetector(
      onTap: () {
        _pageController.jumpToPage(position!);
      },
      child: Center(
        child: widget,
      ),
    );
  }

  void _onPageChange(int value) {
    setState(() {
      widget.currentPage = value;
      widget.hPage=0;
      widget.fPage=0;
    //  _pageController.jumpToPage(widget.currentPage);
    });
  }
}
