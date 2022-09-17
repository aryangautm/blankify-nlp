import 'package:classify/screens/login_screen.dart';
import 'package:classify/screens/signup_screen.dart';
import 'package:classify/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA_GIuHRu9dmQXHnTI-sqE9qTajTX35tkI",
          authDomain: "classify-8f274.firebaseapp.com",
          projectId: "classify-8f274",
          storageBucket: "classify-8f274.appspot.com",
          messagingSenderId: "918200192400",
          appId: "1:918200192400:web:66fc53fa15a956cfa2b715"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classify',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResposiveLayout(
      //     mobileScreenLayout: mobileScreenLayout(),
      //     webScreenLayout: webScreenLayout()
      // ),
      home: LoginScreen(),
    );
  }
}
