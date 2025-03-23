import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnimplementedError();
    }
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3vyhRkdiV1kDGKUSeT4bln5gEABAPA2M',
    appId: '1:538764635625:android:d02e812c17e14d83b06f78',
    messagingSenderId: '538764635625',
    projectId: 'imen-moj-4eeec',
    databaseURL: 'https://imen-moj-4eeec-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'imen-moj-4eeec.firebasestorage.app',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyBqLWsqFjYAdGyihKTahMRDQMo0N6NVjAs',
  //   appId: '1:963656261848:ios:d9e01cfe8b675dfcb237ad',
  //   messagingSenderId: '963656261848',
  //   projectId: 'flutterfire-ui-codelab',
  //   storageBucket: 'flutterfire-ui-codelab.firebasestorage.app',
  //   iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
  //   iosBundleId: 'com.example.complete',
  // );


}
