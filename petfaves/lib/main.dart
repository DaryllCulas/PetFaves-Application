import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:petfaves/login_auth/login_user_auth.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final Function()? onTap;
  const MyApp({super.key, this.onTap});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 221, 218, 218),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(
        onTap: widget.onTap,
      ),
    );
  }
}
