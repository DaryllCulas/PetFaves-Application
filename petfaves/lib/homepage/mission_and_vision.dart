import 'package:flutter/material.dart';

class MissionAndVision extends StatefulWidget {
  const MissionAndVision({super.key});

  @override
  State<MissionAndVision> createState() => _MissionAndVisionState();
}

class _MissionAndVisionState extends State<MissionAndVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mission and Vision'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Mission Statement:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 64, 64),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Our mission is to revolutionize the pet adoption process by providing a user-friendly platform that connects potential pet owners with animals in need of loving homes. We strive to optimize the adoption journey, making it easier for people to find their perfect pet companion while reducing the burden on animal shelters.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'Vision Statement:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 64, 64),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Our vision is a world where every pet finds a forever home and no animal is left behind in shelters or on the streets. We envision a future where our application becomes the go-to resource for pet adoptions, fostering a stronger bond between humans and animals. By using technology, we aim to create a compassionate community that celebrates the joy of pet ownership while promoting responsible practices and advocating for animal welfare.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
