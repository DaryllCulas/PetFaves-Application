import 'package:flutter/material.dart';
import 'package:petfaves/login_auth/login_form.dart';

// In petfeeds.dart
class PetFeeds extends StatefulWidget {
  const PetFeeds({super.key});

  @override
  State<PetFeeds> createState() => _PetFeedsState();
}

class _PetFeedsState extends State<PetFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Image.asset(
          "images/LOGO PETFAVES.png",
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text('PETFEEDS'),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 108, 183, 248),
              ),
              child: Text(
                'User',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2_rounded),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Account Settings'),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        hoverColor: Colors.white,
        onPressed: () {
          debugPrint("You clicked floating action button");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          buildHorizontalList(),
        ],
      ),
    );
  }

  Widget buildHorizontalList() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 100, // Set the height of the horizontal list
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.deepOrange,
          ),
          Container(
            width: 160,
            color: Colors.indigo,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
