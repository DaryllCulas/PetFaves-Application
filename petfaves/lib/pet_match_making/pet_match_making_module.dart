import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petfaves/pet_adoption_process/pet_adoption_process.dart';
import 'package:petfaves/pet_match_making/end_users_messaging_for_adoption.dart';

class PetMatchMaking extends StatefulWidget {
  const PetMatchMaking({
    super.key,
  });

  static void _dummyCallback() {}

  @override
  _PetMatchMakingState createState() => _PetMatchMakingState();
}

class _PetMatchMakingState extends State<PetMatchMaking> {
  int activeIndex = 0;
  final List<String> _images = [
    // 'https://as2.ftcdn.net/v2/jpg/01/99/00/79/1000_F_199007925_NolyRdRrdYqUAGdVZV38P4WX8pYfBaRP.jpg',
    // 'https://as1.ftcdn.net/v2/jpg/04/81/85/46/1000_F_481854656_gHGTnBscKXpFEgVTwAT4DL4NXXNhDKU9.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/13/96/52/1000_F_213965280_VZZncwRZDWcfH2yX1glTdq34xiN4kzA5.jpg',
    'https://firebasestorage.googleapis.com/v0/b/petfaves-b8751.appspot.com/o/bird1.jpg?alt=media&token=51fc1c53-5cee-40e2-a8c7-ea6c399217bb',
    'https://firebasestorage.googleapis.com/v0/b/petfaves-b8751.appspot.com/o/9.jpg?alt=media&token=34a675f8-999b-474b-a17f-1b6f33562105',
    'https://firebasestorage.googleapis.com/v0/b/petfaves-b8751.appspot.com/o/cat10%20(1).jpg?alt=media&token=9b7c9a8c-57a1-44ae-9bf0-ba6e8e576a72',
    'https://firebasestorage.googleapis.com/v0/b/petfaves-b8751.appspot.com/o/10.jpg?alt=media&token=4bd66c74-0ca4-46a8-aefb-a8d5343a2a4d'

    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PetIconCard(
                    icon: Icons.filter_list_outlined,
                    color: Colors.cyan,
                  ),
                  PetIconCard(
                    icon: FontAwesomeIcons.dog,
                    color: Colors.blue,
                  ), // Dog icon
                  PetIconCard(
                    icon: FontAwesomeIcons.cat,
                    color: Colors.orange,
                  ), // Cat icon
                  PetIconCard(
                    icon: FontAwesomeIcons.dove,
                    color: Colors.green,
                  ), // Bird icon
                  PetIconCard(
                    icon: FontAwesomeIcons.fish,
                    color: Colors.blueGrey,
                  ),
                  // Others icon
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                // Carousel slider
                CarouselSlider.builder(
                  itemCount: _images.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 350.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final imageUrl = _images[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the complete details page for the pet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetailsPage(
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Additional widgets or content can be added here
                Container(
                  height: 60.0,
                  width: 280.0,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PetDetailsPage(
                                imageUrl: _images[activeIndex],
                              ),
                            ),
                          );
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25.0,
                            ),
                            Text(
                              'View me',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PetDetailsPage extends StatelessWidget {
  final String imageUrl;

  const PetDetailsPage({
    super.key,
    required this.imageUrl,
  });

  static void _dummyCallback() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(imageUrl),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetAdoptionProcess(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4.0, // <-- Add shadow effect
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Adopt me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EndUsersMessageUponAdoption(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4.0, // <-- Add shadow effect
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.chat,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Message me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
