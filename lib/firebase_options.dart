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
    apiKey: 'AIzaSyAg-2G_jQFxHlPpQNp4_Nlj2_Hyonrjqdk',
    appId: '1:292150332059:web:546b138a3136f5f376543e',
    messagingSenderId: '292150332059',
    projectId: 'todolist-4ef61',
    authDomain: 'todolist-4ef61.firebaseapp.com',
    storageBucket: 'todolist-4ef61.appspot.com',
    measurementId: 'G-5Y926BQP30',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmeX_YehJ2YlZERpECn8aKV5Cjo-PJuH4',
    appId: '1:292150332059:android:c7af204e5af0472776543e',
    messagingSenderId: '292150332059',
    projectId: 'todolist-4ef61',
    storageBucket: 'todolist-4ef61.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnmFZoNFc7aVvUiKAnGL0Iq7imw_tCm6Q',
    appId: '1:292150332059:ios:8cff56993cfffe3176543e',
    messagingSenderId: '292150332059',
    projectId: 'todolist-4ef61',
    storageBucket: 'todolist-4ef61.appspot.com',
    iosBundleId: 'com.example.todolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnmFZoNFc7aVvUiKAnGL0Iq7imw_tCm6Q',
    appId: '1:292150332059:ios:8cff56993cfffe3176543e',
    messagingSenderId: '292150332059',
    projectId: 'todolist-4ef61',
    storageBucket: 'todolist-4ef61.appspot.com',
    iosBundleId: 'com.example.todolist',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAg-2G_jQFxHlPpQNp4_Nlj2_Hyonrjqdk',
    appId: '1:292150332059:web:fea36df0876d2a9976543e',
    messagingSenderId: '292150332059',
    projectId: 'todolist-4ef61',
    authDomain: 'todolist-4ef61.firebaseapp.com',
    storageBucket: 'todolist-4ef61.appspot.com',
    measurementId: 'G-CVR99670YC',
  );
}
