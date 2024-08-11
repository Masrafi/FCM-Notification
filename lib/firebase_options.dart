// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDeX9AOD8EV3kw6ZocGBKkKS_iarq28aq4',
    appId: '1:472044434444:web:5e166c2cb7ccea23c16a29',
    messagingSenderId: '472044434444',
    projectId: 'fcm-messaging-15457',
    authDomain: 'fcm-messaging-15457.firebaseapp.com',
    storageBucket: 'fcm-messaging-15457.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGPvkkCqU8TdxFIDi-Oke1o4xeH2YtplA',
    appId: '1:472044434444:android:9389b8a07f3f153bc16a29',
    messagingSenderId: '472044434444',
    projectId: 'fcm-messaging-15457',
    storageBucket: 'fcm-messaging-15457.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGtFXPiFq3KazPSDs5ExRsZk0FGVD6X90',
    appId: '1:472044434444:ios:25b4aedd65a052d0c16a29',
    messagingSenderId: '472044434444',
    projectId: 'fcm-messaging-15457',
    storageBucket: 'fcm-messaging-15457.appspot.com',
    iosBundleId: 'com.firebasemessaging.fcm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGtFXPiFq3KazPSDs5ExRsZk0FGVD6X90',
    appId: '1:472044434444:ios:25b4aedd65a052d0c16a29',
    messagingSenderId: '472044434444',
    projectId: 'fcm-messaging-15457',
    storageBucket: 'fcm-messaging-15457.appspot.com',
    iosBundleId: 'com.firebasemessaging.fcm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDeX9AOD8EV3kw6ZocGBKkKS_iarq28aq4',
    appId: '1:472044434444:web:994e891052617ca6c16a29',
    messagingSenderId: '472044434444',
    projectId: 'fcm-messaging-15457',
    authDomain: 'fcm-messaging-15457.firebaseapp.com',
    storageBucket: 'fcm-messaging-15457.appspot.com',
  );
}
