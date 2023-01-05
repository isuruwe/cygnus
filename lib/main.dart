import 'package:cygnus/ui/screens/NetflixSubscription.dart';
import 'package:cygnus/ui/screens/ViewProfilePage.dart';
import 'package:cygnus/ui/screens/ViewProfilePage2.dart';
import 'package:cygnus/ui/screens/blocksreen.dart';
import 'package:cygnus/ui/screens/home.dart';
import 'package:cygnus/ui/screens/setings/VerifyPhoneNumberScreen.dart';
import 'package:cygnus/ui/screens/setings/aboutus.dart';
import 'package:cygnus/ui/screens/setings/validation.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/EditProfilePage.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsPage.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsTab.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/UpdatePhoto.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/addmedia.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/chat_screen.dart';
import 'package:cygnus/ui/screens/login_screen.dart';
import 'package:cygnus/ui/screens/matched_screen.dart';
import 'package:cygnus/ui/screens/register_screen.dart';
import 'package:cygnus/ui/screens/splash_screen.dart';
import 'package:cygnus/ui/screens/start_screen.dart';
import 'package:cygnus/ui/screens/fav.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/util/constants.dart';
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

import 'Application.dart';
import 'fcm/firebase_config.dart';
import 'generated/l10n.dart';
import 'ui/screens/setings/phoneval.dart';

//final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: 'AIzaSyArbLdi7I97q91NPRMmcSq34qCBwPa5Wjg',
    //   appId: '1:994600293801:android:0b7c962afd942e5386e0b8',
    //   messagingSenderId: '994600293801',
    //   projectId: 'tune-664be',
    // ),
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title

      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MyApp());
}
String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueAccent));
    //
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


    return   MultiProvider(
       providers: [ChangeNotifierProvider(create: (context) => UserProvider()),

         ChangeNotifierProvider.value(value: LanguageChangeProvider()),
       ],

      child:  Consumer<LanguageChangeProvider>(
          builder: (context, provider, child) =>  MaterialApp(
debugShowCheckedModeBanner: false,
        locale:  Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
        //Provider.of<LanguageChangeProvider>(context).currentLocale,
        localizationsDelegates: [

          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
           // navigatorObservers: [routeObserver],
        theme: ThemeData(

          fontFamily: kFontFamily,
         // accentColor: kSecondaryColor,
          //buttonColor: kAccentColor,
          indicatorColor: kAccentColor,
         primarySwatch:
         MaterialColor(kBackgroundColorInt, kThemeMaterialColor),
         scaffoldBackgroundColor:Colors.transparent,
          hintColor: kSecondaryColor,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,fontFamily:'Nunito' ),
            headline3: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ).apply(
            bodyColor: kAccentColor2,
            displayColor: kSecondaryColor,
          ),
          buttonTheme: ButtonThemeData(
            splashColor: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 14),
            buttonColor: kAccentColor,
            textTheme: ButtonTextTheme.accent,
            highlightColor: Color.fromRGBO(0, 0, 0, .3),
            focusColor: Color.fromRGBO(0, 0, 0, .3),
          ),
        ),



        initialRoute: splash_screen.id,
        routes: {
          fav.id: (context) => fav(0),
          Application.id: (context) => Application(),
          splash_screen.id: (context) => splash_screen(),
          StartScreen.id: (context) => StartScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          TopNavigationScreen.id: (context) => TopNavigationScreen(1,0,0),
          SettingsPage.id: (context) => SettingsPage(),
          SettingsTab.id: (context) => SettingsTab(),
          EditProfilePage.id: (context) => EditProfilePage(0,'Edit Profile'),
          UpdatePhoto.id: (context) => UpdatePhoto(),
          addmedia.id: (context) => addmedia(),
          blockscreen.id: (context) => blockscreen(),
          VerifyPhoneNumberScreen.id: (context) => VerifyPhoneNumberScreen(phoneNumber: '',),
          phoneval.id: (context) => phoneval(),
          aboutus.id: (context) => aboutus(),
          validation.id: (context) => validation(),
          home.id: (context) => home(0),
          OnBoardingPage.id: (context) => OnBoardingPage(),
          NetflixSubscription.id: (context) => NetflixSubscription(),
          ViewProfilePage.id: (context) => ViewProfilePage(uidnew:''),
          ViewProfilePage2.id: (context) => ViewProfilePage2(uidnew:'',notifyParent1: refresh,),
          MatchedScreen.id: (context) => MatchedScreen(
            myProfilePhotoPath: (ModalRoute.of(context)!.settings.arguments
            as Map)['my_profile_photo_path'],
            myUserId: (ModalRoute.of(context)!.settings.arguments
            as Map)['my_user_id'],
            otherUserProfilePhotoPath: (ModalRoute.of(context)!
                .settings
                .arguments as Map)['other_user_profile_photo_path'],
            otherUserId: (ModalRoute.of(context)!.settings.arguments
            as Map)['other_user_id'],
          ),
          ChatScreen.id: (context) => ChatScreen(
            chatId: (ModalRoute.of(context)!.settings.arguments
            as Map)['chat_id'],
            otherUserId: (ModalRoute.of(context)!.settings.arguments
            as Map)['other_user_id'],
            myUserId: (ModalRoute.of(context)!.settings.arguments
            as Map)['user_id'],
          ),
        },


      ),

    ),
    );
  }


}
int _messageCount = 0;
refresh(){

}
/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}


class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: child,
            ),
          ],
        ),

      ),
    );
  }
}