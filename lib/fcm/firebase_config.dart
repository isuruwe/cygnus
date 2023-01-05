import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: '-ENFWVDVlm9-4sMiIAppPyCw',
        authDomain: 'tune-664be.firebaseapp.com	',
        databaseURL: '',
        projectId: 'tune-664be',
        storageBucket: '',
        messagingSenderId: '',
        appId: '1::android:0b7c962afd942e5386e0b8',
        measurementId: '',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: '--',
        appId: '1::android:0b7c962afd942e5386e0b8',
        messagingSenderId: '',
        projectId: 'tune-',
        authDomain: 'tune-.firebaseapp.com	',
        iosBundleId: '',
        iosClientId:
            '',
        databaseURL: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:994600293801:android:',
        apiKey: '',
        projectId: 'tune-664be',
        messagingSenderId: '',
        authDomain: 'tune-.firebaseapp.com	',
        androidClientId:
            '-.apps.googleusercontent.com',
      );
    }
  }
}
