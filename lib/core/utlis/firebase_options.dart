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
    apiKey: 'AIzaSyCjZs24HYLMA42evne0fqtaOfSFKZxZaY0',
    appId: '1:96879535543:web:d497c3ef7cf1f34b747432',
    messagingSenderId: '96879535543',
    projectId: 'foody-12336',
    authDomain: 'foody-12336.firebaseapp.com',
    storageBucket: 'foody-12336.appspot.com',
    measurementId: 'G-ESZKMV31PY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnH8LcVP1Ac94QYHZYYLpMJv3cdDkitkQ',
    appId: '1:96879535543:android:d7669f810a4e5b72747432',
    messagingSenderId: '96879535543',
    projectId: 'foody-12336',
    storageBucket: 'foody-12336.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBog9Loza3IJkwGT1IKE4ULYqtk27CAt7Q',
    appId: '1:96879535543:ios:6e9214746c249971747432',
    messagingSenderId: '96879535543',
    projectId: 'foody-12336',
    storageBucket: 'foody-12336.appspot.com',
    iosBundleId: 'com.example.foody',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBog9Loza3IJkwGT1IKE4ULYqtk27CAt7Q',
    appId: '1:96879535543:ios:1f69b3b52d75eeef747432',
    messagingSenderId: '96879535543',
    projectId: 'foody-12336',
    storageBucket: 'foody-12336.appspot.com',
    iosBundleId: 'com.example.foody.RunnerTests',
  );
}
