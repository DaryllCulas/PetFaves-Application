import 'package:flutter/material.dart';

class PetListRecords extends StatefulWidget {
  const PetListRecords({super.key});

  @override
  State<PetListRecords> createState() => _PetListRecordsState();
}

class _PetListRecordsState extends State<PetListRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet List Records'),
      ),
      body: const Center(
        child: Text(
          'Pet List Records Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
