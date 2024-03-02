// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_sample_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const String appTitle = 'One piece call card';
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 182, 212, 228)),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: PracticeLayoutHere(),
      ),
    );
  }
}
