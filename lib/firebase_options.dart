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
    apiKey: 'AIzaSyCLybwDfS9d9SApFynzvfIEfVTW9W7IOMw',
    appId: '1:401808037664:web:08c230c9cc40155a9ba945',
    messagingSenderId: '401808037664',
    projectId: 'autenticacion-9aea8',
    authDomain: 'autenticacion-9aea8.firebaseapp.com',
    storageBucket: 'autenticacion-9aea8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHXorohI60hv8N1IEiKBWDGpIJ1D_RM7w',
    appId: '1:401808037664:android:410ff3c77416d44e9ba945',
    messagingSenderId: '401808037664',
    projectId: 'autenticacion-9aea8',
    storageBucket: 'autenticacion-9aea8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAX-QYHAzoBstgPGxTVw_UdU9tm0g4ViEg',
    appId: '1:401808037664:ios:ae8b8698c999dfa79ba945',
    messagingSenderId: '401808037664',
    projectId: 'autenticacion-9aea8',
    storageBucket: 'autenticacion-9aea8.appspot.com',
    iosClientId: '401808037664-psqbh0acumhf0r85507pmq0n3c8siq5e.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAX-QYHAzoBstgPGxTVw_UdU9tm0g4ViEg',
    appId: '1:401808037664:ios:ae8b8698c999dfa79ba945',
    messagingSenderId: '401808037664',
    projectId: 'autenticacion-9aea8',
    storageBucket: 'autenticacion-9aea8.appspot.com',
    iosClientId: '401808037664-psqbh0acumhf0r85507pmq0n3c8siq5e.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLybwDfS9d9SApFynzvfIEfVTW9W7IOMw',
    appId: '1:401808037664:web:5d26d9cd404132499ba945',
    messagingSenderId: '401808037664',
    projectId: 'autenticacion-9aea8',
    authDomain: 'autenticacion-9aea8.firebaseapp.com',
    storageBucket: 'autenticacion-9aea8.appspot.com',
  );

}