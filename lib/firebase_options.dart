// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAxnWsa3ldKNnIHRHcSZUGWw1BIL_lx6wk',
    appId: '1:941391211804:web:30db15b51bd10bff2c9ed9',
    messagingSenderId: '941391211804',
    projectId: 'notification-somo',
    authDomain: 'notification-somo.firebaseapp.com',
    storageBucket: 'notification-somo.appspot.com',
    measurementId: 'G-S51D5K7BXX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC48JETJ8y9Ej6lqjmFRcB8VuKAoOlbGOw',
    appId: '1:941391211804:android:f51e54834b480d112c9ed9',
    messagingSenderId: '941391211804',
    projectId: 'notification-somo',
    storageBucket: 'notification-somo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8UQTeYd_1DFQuluPDJxSSk_6JZyDkAKE',
    appId: '1:118109128001:ios:e7507b55d8b0ccc4b20dc0',
    messagingSenderId: '118109128001',
    projectId: 'nebula-55342',
    storageBucket: 'nebula-55342.appspot.com',
    iosClientId: '118109128001-2u9e8qj8p60u6sinfpgv0in0rq1et078.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelNebula',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8UQTeYd_1DFQuluPDJxSSk_6JZyDkAKE',
    appId: '1:118109128001:ios:fd41ab0293d58448b20dc0',
    messagingSenderId: '118109128001',
    projectId: 'nebula-55342',
    storageBucket: 'nebula-55342.appspot.com',
    iosClientId: '118109128001-01oc9cijmdrhpgc2pa9rmrb4ob2kgabo.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelNebula.RunnerTests',
  );
}