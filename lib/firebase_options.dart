
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
    apiKey: 'AIzaSyB1DZcSGUhS05qB4LJJF0WZV68mD_4A8l0',
    appId: '1:405133718043:web:4f4acf89450b16bbc37ebe',
    messagingSenderId: '405133718043',
    projectId: 'kt-1-dcb75',
    authDomain: 'kt-1-dcb75.firebaseapp.com',
    storageBucket: 'kt-1-dcb75.appspot.com',
    measurementId: 'G-125XE5MK8R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD5TzWtEzSTsBlPLBgVPdO5tvlRRnUCLE',
    appId: '1:405133718043:android:91bb60fbc8981159c37ebe',
    messagingSenderId: '405133718043',
    projectId: 'kt-1-dcb75',
    storageBucket: 'kt-1-dcb75.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNUNIl9QRPwWV0JKQnHbj-gBqw5GZNOXE',
    appId: '1:405133718043:ios:c7448af5cd92b10cc37ebe',
    messagingSenderId: '405133718043',
    projectId: 'kt-1-dcb75',
    storageBucket: 'kt-1-dcb75.appspot.com',
    iosBundleId: 'com.example.ktxo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNUNIl9QRPwWV0JKQnHbj-gBqw5GZNOXE',
    appId: '1:405133718043:ios:213b0655c1c5f69cc37ebe',
    messagingSenderId: '405133718043',
    projectId: 'kt-1-dcb75',
    storageBucket: 'kt-1-dcb75.appspot.com',
    iosBundleId: 'com.example.ktxo.RunnerTests',
  );
}
