import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PetMatchMaking extends StatefulWidget {
  const PetMatchMaking({super.key});

  @override
  _PetMatchMakingState createState() => _PetMatchMakingState();
}

class _PetMatchMakingState extends State<PetMatchMaking> {
  // int _currentIndex = 0;
  final List<String> _images = [
    'https://as2.ftcdn.net/v2/jpg/01/99/00/79/1000_F_199007925_NolyRdRrdYqUAGdVZV38P4WX8pYfBaRP.jpg',
    'https://as1.ftcdn.net/v2/jpg/04/81/85/46/1000_F_481854656_gHGTnBscKXpFEgVTwAT4DL4NXXNhDKU9.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/13/96/52/1000_F_213965280_VZZncwRZDWcfH2yX1glTdq34xiN4kzA5.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              height: 500.0,
            ),
            items: _images.map((imageUrl) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                      10.0), // Optional: Add border radius for card-like appearance
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
          // Additional widgets or content can be added here
        ],
      ),
    );
  }
}
