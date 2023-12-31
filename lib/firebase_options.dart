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
    apiKey: 'AIzaSyD6wsgS6G2OOpgfvBDSOWAILAyBFpDOIxU',
    appId: '1:158702842561:web:498ddebe2a6874209f9a40',
    messagingSenderId: '158702842561',
    projectId: 'ourmessenger-60e57',
    authDomain: 'ourmessenger-60e57.firebaseapp.com',
    storageBucket: 'ourmessenger-60e57.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjhTiOf4SaGLpj0_Xi7Xjru80tpZ-9GUQ',
    appId: '1:158702842561:android:24ddc55471e79fd39f9a40',
    messagingSenderId: '158702842561',
    projectId: 'ourmessenger-60e57',
    storageBucket: 'ourmessenger-60e57.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeArjUE9eD5g6C89Yu_3iI1COUN3lSk-4',
    appId: '1:158702842561:ios:86cd9481f699300f9f9a40',
    messagingSenderId: '158702842561',
    projectId: 'ourmessenger-60e57',
    storageBucket: 'ourmessenger-60e57.appspot.com',
    iosBundleId: 'com.example.ourmessenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeArjUE9eD5g6C89Yu_3iI1COUN3lSk-4',
    appId: '1:158702842561:ios:d3aa427c278eafaf9f9a40',
    messagingSenderId: '158702842561',
    projectId: 'ourmessenger-60e57',
    storageBucket: 'ourmessenger-60e57.appspot.com',
    iosBundleId: 'com.example.ourmessenger.RunnerTests',
  );
}
