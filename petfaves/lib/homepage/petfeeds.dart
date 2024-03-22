import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/donationpage/donation_module.dart';
import 'package:petfaves/homepage/homescreen.dart';
import 'package:petfaves/login_auth/login_form.dart';
// import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/pet_match_making/pet_match_making_module.dart';
import 'package:petfaves/profile/profile_info.dart';

class PetFeeds extends StatefulWidget {
  const PetFeeds({
    super.key,
  });

  @override
  _PetFeedsState createState() => _PetFeedsState();
}

class _PetFeedsState extends State<PetFeeds> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BuildHomePage(),
    const PetMatchMaking(),
    const DonationScreen(),
  ];
  void signUserOut() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login page after signing out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      debugPrint("Error signing out: $e");
      // Handle sign-out error
    }
  }

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
          'PetFeeds',
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
              leading: const Icon(Icons.settings),
              title: const Text('Account Settings'),
              onTap: () {
                Navigator.pop(context);
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
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 99, 187, 245),
              onPressed: () {
                debugPrint("You clicked floating action button");
              },
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            )
          : null,
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
