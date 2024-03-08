import 'package:flutter/material.dart';
import 'package:petfaves/homepage/petfeeds.dart';

// import 'package:petfaves/homepage/petfeeds.dart';
// import 'package:petfaves/login_auth/login_form.dart';

// import 'package:petfaves/login_auth/login_form.dart';
// import 'package:petfaves/homepage/petfeeds.dart';
// import 'package:petfaves/login_auth/login_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 221, 218, 218),
      ),
      debugShowCheckedModeBanner: false,
      // home: const LoginPage(),
      home: const PetFeeds(),
    );
  }
}
