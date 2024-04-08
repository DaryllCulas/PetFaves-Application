import 'package:flutter/material.dart';

class PetCareSection extends StatefulWidget {
  const PetCareSection({super.key});

  @override
  State<PetCareSection> createState() => _PetCareSectionState();
}

class _PetCareSectionState extends State<PetCareSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care Section'),
      ),
      body: const Center(
        child: Text(
          'Pet Care Section Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
