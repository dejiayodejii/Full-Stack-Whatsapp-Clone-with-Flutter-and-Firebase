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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDv-GL3bAlljG2VhmbUQ1LpiFjUzW19-Do',
    appId: '1:608233966119:web:a391ffba3273cf50671c02',
    messagingSenderId: '608233966119',
    projectId: 'whatsapp-backend-a1cd9',
    authDomain: 'whatsapp-backend-a1cd9.firebaseapp.com',
    storageBucket: 'whatsapp-backend-a1cd9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvMFjYRDLqbbeWHP_9OGowrhPXZoeDo_E',
    appId: '1:608233966119:android:f0df2a11fc91a2c6671c02',
    messagingSenderId: '608233966119',
    projectId: 'whatsapp-backend-a1cd9',
    storageBucket: 'whatsapp-backend-a1cd9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLvY9VdFei4__R3h68D2SLWzXVT2pRyGM',
    appId: '1:608233966119:ios:9ebe5ef8bd91e15c671c02',
    messagingSenderId: '608233966119',
    projectId: 'whatsapp-backend-a1cd9',
    storageBucket: 'whatsapp-backend-a1cd9.appspot.com',
    iosClientId: '608233966119-hkufpe1tpucsuteo42089ao8lj93rpu7.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone',
  );
}
