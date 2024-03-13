import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:petfaves/pet_match_making/pet_match_making_module.dart';
import 'firebase_options.dart';

// import 'package:petfaves/homepage/content_feeds.dart';
// import 'package:petfaves/homepage/petfeeds.dart';
// import 'package:petfaves/profile/profile_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 221, 218, 218),
      ),

      debugShowCheckedModeBanner: false,
      // home: const LoginPage(),
      home: LoginPage(),
    );
  }
}
