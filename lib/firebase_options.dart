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
    apiKey: 'AIzaSyCnUOJ1lWWBrK1QLS4ubc5TOs_n0o2oCQw',
    appId: '1:666806924822:web:5bf60ae76713511ea76737',
    messagingSenderId: '666806924822',
    projectId: 'weview-365ae',
    authDomain: 'weview-365ae.firebaseapp.com',
    storageBucket: 'weview-365ae.firebasestorage.app',
    measurementId: 'G-KCYWWBWJJ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlCVb5mYIuhTjnAP0-cz9GmzJLuEkvtAU',
    appId: '1:666806924822:android:7b5d26afc8dfbbb7a76737',
    messagingSenderId: '666806924822',
    projectId: 'weview-365ae',
    storageBucket: 'weview-365ae.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA16lWkj1SC9B7lduRyJT5Y5H4wUCz5vuM',
    appId: '1:666806924822:ios:8f4f6aaa9d669715a76737',
    messagingSenderId: '666806924822',
    projectId: 'weview-365ae',
    storageBucket: 'weview-365ae.firebasestorage.app',
    iosClientId: '666806924822-a97453dm9u1mh367d27cr2u0lbmtfqbg.apps.googleusercontent.com',
    iosBundleId: 'com.kintree.weview.weview',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA16lWkj1SC9B7lduRyJT5Y5H4wUCz5vuM',
    appId: '1:666806924822:ios:8f4f6aaa9d669715a76737',
    messagingSenderId: '666806924822',
    projectId: 'weview-365ae',
    storageBucket: 'weview-365ae.firebasestorage.app',
    iosClientId: '666806924822-a97453dm9u1mh367d27cr2u0lbmtfqbg.apps.googleusercontent.com',
    iosBundleId: 'com.kintree.weview.weview',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCnUOJ1lWWBrK1QLS4ubc5TOs_n0o2oCQw',
    appId: '1:666806924822:web:cfc8d6bd2c8a5920a76737',
    messagingSenderId: '666806924822',
    projectId: 'weview-365ae',
    authDomain: 'weview-365ae.firebaseapp.com',
    storageBucket: 'weview-365ae.firebasestorage.app',
    measurementId: 'G-TNPER08QY8',
  );
}
