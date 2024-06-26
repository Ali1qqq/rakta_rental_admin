// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBLem9ns_o3BItUmcUhxV_OdPC0SzOo3_M',
    appId: '1:236408407506:web:427028fad4ca35e7f5f40b',
    messagingSenderId: '236408407506',
    projectId: 'rak-rent',
    authDomain: 'rak-rent.firebaseapp.com',
    storageBucket: 'rak-rent.appspot.com',
    measurementId: 'G-RSL6H8FRTV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxryjik9xw9Mre256iGIw-dmI03UWF1zs',
    appId: '1:236408407506:android:9efed281a00ac21cf5f40b',
    messagingSenderId: '236408407506',
    projectId: 'rak-rent',
    storageBucket: 'rak-rent.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhkK3cyCocsLmR1ritz-pJfwKnQ7slI6o',
    appId: '1:236408407506:ios:cb77025fa5d43b6cf5f40b',
    messagingSenderId: '236408407506',
    projectId: 'rak-rent',
    storageBucket: 'rak-rent.appspot.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhkK3cyCocsLmR1ritz-pJfwKnQ7slI6o',
    appId: '1:236408407506:ios:cb77025fa5d43b6cf5f40b',
    messagingSenderId: '236408407506',
    projectId: 'rak-rent',
    storageBucket: 'rak-rent.appspot.com',
    iosBundleId: 'com.example.admin',
  );
}
