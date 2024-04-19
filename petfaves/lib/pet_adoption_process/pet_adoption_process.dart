import 'package:flutter/material.dart';

class PetAdoptionProcess extends StatefulWidget {
  const PetAdoptionProcess({super.key});

  @override
  State<PetAdoptionProcess> createState() => _PetAdoptionProcessState();
}

class _PetAdoptionProcessState extends State<PetAdoptionProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption Process'),
      ),
      body: const Center(
        child: Text(
          'Pet Adoption Process Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
