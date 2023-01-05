import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: 'AIzaSyA3ko9oWiU-ENFWVDVlm9-4sMiIAppPyCw',
        authDomain: 'tune-664be.firebaseapp.com	',
        databaseURL: '',
        projectId: 'tune-664be',
        storageBucket: '',
        messagingSenderId: '994600293801',
        appId: '1:994600293801:android:0b7c962afd942e5386e0b8',
        measurementId: '',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: 'AIzaSyA3ko9oWiU-ENFWVDVlm9-4sMiIAppPyCw',
        appId: '1:994600293801:android:0b7c962afd942e5386e0b8',
        messagingSenderId: '994600293801',
        projectId: 'tune-664be',
        authDomain: 'tune-664be.firebaseapp.com	',
        iosBundleId: '',
        iosClientId:
            '',
        databaseURL: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:994600293801:android:0b7c962afd942e5386e0b8',
        apiKey: 'AIzaSyArbLdi7I97q91NPRMmcSq34qCBwPa5Wjg',
        projectId: 'tune-664be',
        messagingSenderId: '994600293801',
        authDomain: 'tune-664be.firebaseapp.com	',
        androidClientId:
            '448618578101-sg12d2qin42cpr00f8b0gehs5s7inm0v.apps.googleusercontent.com',
      );
    }
  }
}
