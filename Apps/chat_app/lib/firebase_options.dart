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
    apiKey: 'AIzaSyBcVYjfEEJT7FKqcmioSLtHqLqjAOMmhzM',
    appId: '1:984050398384:web:bb43c466646a766bd17775',
    messagingSenderId: '984050398384',
    projectId: 'chat-app-6990e',
    authDomain: 'chat-app-6990e.firebaseapp.com',
    storageBucket: 'chat-app-6990e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRhYW0fjGQwZNd9-qpNUveHAy-0_dJ0f4',
    appId: '1:984050398384:android:c26f32343f558728d17775',
    messagingSenderId: '984050398384',
    projectId: 'chat-app-6990e',
    storageBucket: 'chat-app-6990e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCXkDiTg622jkzSb0z2cw7QEAS970avVo',
    appId: '1:984050398384:ios:3eb4103f83ab2313d17775',
    messagingSenderId: '984050398384',
    projectId: 'chat-app-6990e',
    storageBucket: 'chat-app-6990e.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCXkDiTg622jkzSb0z2cw7QEAS970avVo',
    appId: '1:984050398384:ios:3eb4103f83ab2313d17775',
    messagingSenderId: '984050398384',
    projectId: 'chat-app-6990e',
    storageBucket: 'chat-app-6990e.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcVYjfEEJT7FKqcmioSLtHqLqjAOMmhzM',
    appId: '1:984050398384:web:fecea8e49d7fbe9ed17775',
    messagingSenderId: '984050398384',
    projectId: 'chat-app-6990e',
    authDomain: 'chat-app-6990e.firebaseapp.com',
    storageBucket: 'chat-app-6990e.firebasestorage.app',
  );
}
