import 'package:flutter/material.dart';

class AboutPetFaves extends StatefulWidget {
  const AboutPetFaves({super.key});

  @override
  State<AboutPetFaves> createState() => _AboutPetFavesState();
}

class _AboutPetFavesState extends State<AboutPetFaves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About PetFaves'),
      ),
      body: const Center(
        child: Text(
          'About PetFaves Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
