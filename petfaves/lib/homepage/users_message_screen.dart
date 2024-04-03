import 'package:flutter/material.dart';

class EndUsersMessage extends StatefulWidget {
  const EndUsersMessage({super.key});

  @override
  State<EndUsersMessage> createState() => _EndUsersMessageState();
}

class _EndUsersMessageState extends State<EndUsersMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(
        child: Text(
          'Users Message Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
