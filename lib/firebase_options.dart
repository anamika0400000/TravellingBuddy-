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
    apiKey: 'AIzaSyB4paGY_bN3-Yim2zM5l4-HjzRVgdp-K94',
    appId: '1:950097637908:web:8a50cdb9cbd263f8836d01',
    messagingSenderId: '950097637908',
    projectId: 'travelling-buddy',
    authDomain: 'travelling-buddy.firebaseapp.com',
    storageBucket: 'travelling-buddy.appspot.com',
    measurementId: 'G-E680QM4BGF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlXgdE7eu-5D3-eKELzv6IKtA837odEcI',
    appId: '1:950097637908:android:78f0cf056895680c836d01',
    messagingSenderId: '950097637908',
    projectId: 'travelling-buddy',
    storageBucket: 'travelling-buddy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXnGMKa_bp2gTyfmyXoxaOjGR_gl253mM',
    appId: '1:950097637908:ios:3443638fded205db836d01',
    messagingSenderId: '950097637908',
    projectId: 'travelling-buddy',
    storageBucket: 'travelling-buddy.appspot.com',
    iosBundleId: 'com.example.travellingBuddy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXnGMKa_bp2gTyfmyXoxaOjGR_gl253mM',
    appId: '1:950097637908:ios:3443638fded205db836d01',
    messagingSenderId: '950097637908',
    projectId: 'travelling-buddy',
    storageBucket: 'travelling-buddy.appspot.com',
    iosBundleId: 'com.example.travellingBuddy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4paGY_bN3-Yim2zM5l4-HjzRVgdp-K94',
    appId: '1:950097637908:web:f2ab44a4df5ddcc4836d01',
    messagingSenderId: '950097637908',
    projectId: 'travelling-buddy',
    authDomain: 'travelling-buddy.firebaseapp.com',
    storageBucket: 'travelling-buddy.appspot.com',
    measurementId: 'G-D46SGDZP7Z',
  );
}
