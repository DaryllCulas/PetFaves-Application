import 'package:flutter/material.dart';

class PetMatchMakingSettings extends StatefulWidget {
  const PetMatchMakingSettings({super.key});

  @override
  State<PetMatchMakingSettings> createState() => _PetMatchMakingSettingsState();
}

class _PetMatchMakingSettingsState extends State<PetMatchMakingSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Match Making Settings'),
      ),
      body: const Center(
        child: Text(
          'Pet Match Making Settings Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
