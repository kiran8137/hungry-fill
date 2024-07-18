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
    apiKey: 'AIzaSyCx8eyONUEdYplhhkWNzrtROKi25-5eDDo',
    appId: '1:1043826955704:web:957d0bb9b53fd43f6c6b4d',
    messagingSenderId: '1043826955704',
    projectId: 'hungry-fill',
    authDomain: 'hungry-fill.firebaseapp.com',
    storageBucket: 'hungry-fill.appspot.com',
    measurementId: 'G-1FV4Q5E43N',
  );
 
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkw6SrHz-CB059KeFP7ukROEy2LnMb874',
    appId: '1:1043826955704:android:3f600614f28170c86c6b4d',
    messagingSenderId: '1043826955704',
    projectId: 'hungry-fill',
    storageBucket: 'hungry-fill.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOFz2GJ6kdyUNdmRkjTubWEl8_RyBP8-Y',
    appId: '1:1043826955704:ios:47fba01e3e9c23d26c6b4d',
    messagingSenderId: '1043826955704',
    projectId: 'hungry-fill',
    storageBucket: 'hungry-fill.appspot.com',
    iosBundleId: 'com.example.hungryFill',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOFz2GJ6kdyUNdmRkjTubWEl8_RyBP8-Y',
    appId: '1:1043826955704:ios:47fba01e3e9c23d26c6b4d',
    messagingSenderId: '1043826955704',
    projectId: 'hungry-fill',
    storageBucket: 'hungry-fill.appspot.com',
    iosBundleId: 'com.example.hungryFill',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCx8eyONUEdYplhhkWNzrtROKi25-5eDDo',
    appId: '1:1043826955704:web:faa139f2adf5fac96c6b4d',
    messagingSenderId: '1043826955704',
    projectId: 'hungry-fill',
    authDomain: 'hungry-fill.firebaseapp.com',
    storageBucket: 'hungry-fill.appspot.com',
    measurementId: 'G-XX1MTGY2WE',
  );
}