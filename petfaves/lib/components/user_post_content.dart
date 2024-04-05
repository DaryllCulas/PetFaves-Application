import 'package:flutter/material.dart';

class UserPostContent extends StatefulWidget {
  const UserPostContent({super.key});

  @override
  State<UserPostContent> createState() => _UserPostContentState();
}

class _UserPostContentState extends State<UserPostContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Something'),
      ),
      body: const Center(
        child: Text(
          'User Post Content Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
