import 'package:flutter/material.dart';

class EndUsersMessageUponAdoption extends StatefulWidget {
  const EndUsersMessageUponAdoption({super.key});

  @override
  State<EndUsersMessageUponAdoption> createState() =>
      _EndUsersMessageUponAdoptionState();
}

class _EndUsersMessageUponAdoptionState
    extends State<EndUsersMessageUponAdoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Me'),
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
