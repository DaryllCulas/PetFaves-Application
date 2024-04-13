import 'package:flutter/material.dart';

class GetStartedToAdopt extends StatefulWidget {
  const GetStartedToAdopt({super.key});

  @override
  State<GetStartedToAdopt> createState() => _GetStartedToAdoptState();
}

class _GetStartedToAdoptState extends State<GetStartedToAdopt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started to Adopt'),
      ),
      body: const Center(
        child: Text(
          'Get Started to Adopt Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
