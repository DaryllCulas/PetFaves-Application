import 'package:flutter/material.dart';

class PetPreferences extends StatefulWidget {
  const PetPreferences({super.key});

  @override
  State<PetPreferences> createState() => _PetPreferencesState();
}

class _PetPreferencesState extends State<PetPreferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pet Preferences Details'),
        ),
      ),
      body: const Center(
        child: Text(
          'Pet Preferences Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
