import 'package:flutter/material.dart';
import 'package:petfaves/homepage/petfeeds.dart';

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
          scaffoldBackgroundColor: const Color.fromARGB(134, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      home: const PetFeeds(),
    );
  }
}
