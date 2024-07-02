import 'package:flutter/material.dart';
import 'package:north_coast_flutter/screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAMQQcc0-IPlqZVWomtct-Zy8PxNItgdFM",
          authDomain: "northcoast-clone.firebaseapp.com",
          projectId: "northcoast-clone",
          storageBucket: "northcoast-clone.appspot.com",
          messagingSenderId: "433119891405",
          appId: "1:433119891405:web:b1440bae9bcf9fd1f6be84"));
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
