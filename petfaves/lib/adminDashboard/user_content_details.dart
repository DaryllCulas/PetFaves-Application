import 'package:flutter/material.dart';

class UsersContent extends StatefulWidget {
  const UsersContent({super.key});

  @override
  State<UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<UsersContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Content Details'),
      ),
      body: const Center(
        child: Text(
          'User Content Details Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
