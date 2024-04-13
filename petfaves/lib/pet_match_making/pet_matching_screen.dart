import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petfaves/PetPreferences/pet_preferences_details.dart';
import 'package:petfaves/donationpage/donation_module.dart';
import 'package:petfaves/homepage/about_petfaves.dart';
import 'package:petfaves/homepage/highlights_screen.dart';
import 'package:petfaves/homepage/homescreen.dart';
import 'package:petfaves/homepage/user_account_settings_screen.dart';
import 'package:petfaves/homepage/users_message_screen.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/pet_match_making/pet_match_making_module.dart';
import 'package:petfaves/petcare_section/pet_care_section.dart';
import 'package:petfaves/profile/profile_info.dart';

class PetMatchMakingScreen extends StatefulWidget {
  const PetMatchMakingScreen({Key? key}) : super(key: key);

  @override
  State<PetMatchMakingScreen> createState() => _PetMatchMakingScreenState();
}

class _PetMatchMakingScreenState extends State<PetMatchMakingScreen> {
  final List<Widget> _pages = [
    const BuildHomePage(),
    const PetMatchMaking(),
    const DonationScreen(),
  ];

  int _selectedIndex = 1;
  final user = FirebaseAuth.instance.currentUser!;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          'Pet Match Making',
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HighLightsScreen(),
                  ),
                );
              },
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 10.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_sharp),
            label: "Adopt Me",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.money,
            ),
            label: "Donate",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 99, 187, 245),
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
