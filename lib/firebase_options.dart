import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwklPK_BBgYcCaKtV2tdZPSWwXF4VIwFo',
    appId: '1:318721086619:android:da9e905fefd7f506f9e23e',
    messagingSenderId: '318721086619',
    projectId: 'ukkmate',
    storageBucket: 'ukkmate.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyI86QgvDZscL8CNAvrHXM2EBECeYqrik',
    appId: '1:318721086619:ios:94f26ab453c2092ef9e23e',
    messagingSenderId: '318721086619',
    projectId: 'ukkmate',
    storageBucket: 'ukkmate.firebasestorage.app',
    iosBundleId: 'com.example.ukkmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'REPLACE_WITH_MACOS_API_KEY',
    appId: 'REPLACE_WITH_MACOS_APP_ID',
    messagingSenderId: 'REPLACE_WITH_MACOS_MESSAGING_SENDER_ID',
    projectId: 'ukkmate',
    storageBucket: 'ukkmate.firebasestorage.app',
    iosBundleId: 'com.example.ukkmate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'REPLACE_WITH_WINDOWS_API_KEY',
    appId: 'REPLACE_WITH_WINDOWS_APP_ID',
    messagingSenderId: 'REPLACE_WITH_WINDOWS_MESSAGING_SENDER_ID',
    projectId: 'ukkmate',
    authDomain: 'ukkmate.firebaseapp.com',
    storageBucket: 'ukkmate.firebasestorage.app',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'REPLACE_WITH_LINUX_API_KEY',
    appId: 'REPLACE_WITH_LINUX_APP_ID',
    messagingSenderId: 'REPLACE_WITH_LINUX_MESSAGING_SENDER_ID',
    projectId: 'ukkmate',
    authDomain: 'ukkmate.firebaseapp.com',
    storageBucket: 'ukkmate.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAHJQ9W39t7zp9OPhH4ak4lh26YBG26FEU',
    appId: '1:318721086619:web:82fcb78b9b3fe2a4f9e23e',
    messagingSenderId: '318721086619',
    projectId: 'ukkmate',
    authDomain: 'ukkmate.firebaseapp.com',
    storageBucket: 'ukkmate.firebasestorage.app',
    measurementId: 'G-PYTBWFFY61',
  );
}
