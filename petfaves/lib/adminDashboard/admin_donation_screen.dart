import 'package:flutter/material.dart';

class AdminDonationScreen extends StatefulWidget {
  const AdminDonationScreen({super.key});

  @override
  State<AdminDonationScreen> createState() => _AdminDonationScreenState();
}

class _AdminDonationScreenState extends State<AdminDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Details'),
      ),
      body: const Center(
        child: Text(
          'Admin Donation Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
