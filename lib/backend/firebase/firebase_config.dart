import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAkrrDhoHM0bVRzRvb_NMjxxcyC6IpUJWY",
            authDomain: "projectbread-karaokay.firebaseapp.com",
            projectId: "projectbread-karaokay",
            storageBucket: "projectbread-karaokay.appspot.com",
            messagingSenderId: "936698531920",
            appId: "1:936698531920:web:2916bc8b554aa000070155"));
  } else {
    await Firebase.initializeApp();
  }
}
