import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PetMatchMaking extends StatefulWidget {
  const PetMatchMaking({super.key});

  @override
  _PetMatchMakingState createState() => _PetMatchMakingState();
}

class _PetMatchMakingState extends State<PetMatchMaking> {
  final List<String> _images = [
    'https://as2.ftcdn.net/v2/jpg/01/99/00/79/1000_F_199007925_NolyRdRrdYqUAGdVZV38P4WX8pYfBaRP.jpg',
    'https://as1.ftcdn.net/v2/jpg/04/81/85/46/1000_F_481854656_gHGTnBscKXpFEgVTwAT4DL4NXXNhDKU9.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/13/96/52/1000_F_213965280_VZZncwRZDWcfH2yX1glTdq34xiN4kzA5.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PetIconCard(icon: Icons.pets, color: Colors.blue), // Dog icon
                  PetIconCard(
                      icon: Icons.pets, color: Colors.orange), // Cat icon
                  PetIconCard(
                      icon: Icons.pets, color: Colors.green), // Bird icon
                  PetIconCard(
                      icon: Icons.pets, color: Colors.red), // Reptile icon
                  // Others icon
                  PetIconCard(icon: Icons.pets, color: Colors.purple),
                  PetIconCard(icon: Icons.pets, color: Colors.cyan),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 350.0,
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
          ),
        ),
      ],
    );
  }
}

class PetIconCard extends StatelessWidget {
  final IconData icon;
  final Color color;

  const PetIconCard({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3.0,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            size: 40.0,
            color: color,
          ),
        ),
      ),
    );
  }
}
