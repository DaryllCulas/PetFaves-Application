import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petfaves/PetPreferences/pet_preferences_details.dart';
import 'package:petfaves/homepage/about_petfaves.dart';
import 'package:petfaves/homepage/pet_care_section.dart';
import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/homepage/user_account_settings_screen.dart';
import 'package:petfaves/homepage/users_message_screen.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/profile/profile_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HighLightsScreen extends StatefulWidget {
  const HighLightsScreen({Key? key});

  @override
  State<HighLightsScreen> createState() => _HighLightsScreenState();
}

class _HighLightsScreenState extends State<HighLightsScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();
  late Future<String> _randomDogImageUrl;

  @override
  void initState() {
    super.initState();
    _randomDogImageUrl = fetchRandomDogImage(); // Call the API here
  }

  Future<String> fetchRandomDogImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data[
          'message']; // This will contain the URL of the random dog image
    } else {
      throw Exception('Failed to load random dog image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          "assets/LOGO PETFAVES.png",
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Highlights',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 99, 187, 245),
              ),
              accountName: Text(
                user.email!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with your user's avatar URL
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.person_2_rounded),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage1(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.paw),
              title: const Text('About PetFaves'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AboutPetFaves(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.info),
              title: const Text('Pet Care'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PetCareSection(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_sharp),
              title: const Text('Messages'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EndUsersMessage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Pet Preferences Modification'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PetPreferences(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Account Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserSettingScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 200, // Adjust the height of the PageView
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                // First Slide
                Container(
                  width: double
                      .infinity, // Adjust the width of the container to match the PageView
                  margin: const EdgeInsets.all(10), // Adjust margin here
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 76, 174, 240),
                    borderRadius:
                        BorderRadius.circular(20), // Adjust border radius here
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Pet adoption',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'made easy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4.0, // <-- Add shadow effect
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Action for adoption button
                        },
                        child: const Text(
                          'Adopt now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                // Second Slide
                Container(
                  width: double
                      .infinity, // Adjust the width of the container to match the PageView
                  margin: const EdgeInsets.all(10), // Adjust margin here
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(20), // Adjust border radius here
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Pet adoption',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'made easy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4.0, // <-- Add shadow effect
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Action for adoption button
                        },
                        child: const Text(
                          'Adopt now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (index) => Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPageIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften shadow
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: Color.fromARGB(
                      255, 134, 131, 131), // Adjust color as needed
                ),
                width: 100,
                height: 100,
                child: const Center(
                  child: Text(
                    'About PetFaves',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften shadow
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: Color.fromARGB(
                      255, 134, 131, 131), // Adjust color as needed
                ),
                width: 100,
                height: 100,
                child: const Center(
                  child: Text(
                    'Mission & Vision',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to PetFeeds()
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PetFeeds()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0, // soften shadow
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(
                        255, 134, 131, 131), // Adjust color as needed
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(
                    child: Text(
                      'Pet Feeds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: (8 / 2).ceil(), // Number of rows (assuming 8 items)
              itemBuilder: (context, rowIndex) {
                return Row(
                  children: [
                    // First item in the row
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildItem(rowIndex * 2),
                      ),
                    ),
                    // Second item in the row
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildItem(rowIndex * 2 + 1),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index >= 8) {
      return const SizedBox(); // Return an empty SizedBox if index exceeds the number of items
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Add border for visualization
        borderRadius:
            BorderRadius.circular(8.0), // Add border radius for rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: unnecessary_null_comparison
            child: _randomDogImageUrl == null
                ? CircularProgressIndicator() // Show loading indicator if _randomDogImageUrl is null
                : FutureBuilder<String>(
                    future: _randomDogImageUrl,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a loading indicator while fetching the image
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Show an error message if fetching fails
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Image fetched successfully, display it
                        final imageUrl = snapshot.data!;
                        return Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        );
                      }
                    },
                  ),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Icon(Icons.favorite_outline_outlined, color: Colors.red),
                  ],
                ),
                Text('Age:', style: TextStyle(color: Colors.black)),
                Text('Location:', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
