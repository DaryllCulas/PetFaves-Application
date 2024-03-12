import 'package:flutter/material.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/profile/profile_info.dart';

// In petfeeds.dart
class PetFeeds extends StatefulWidget {
  const PetFeeds({super.key});

  @override
  State<PetFeeds> createState() => _PetFeedsState();
}

class _PetFeedsState extends State<PetFeeds> {
  int _selectedIndex = 0;
  bool isDark = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
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
        ), // Include the search functionality here
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 99, 187, 245),
              ),
              accountName: Text(
                'User',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
              accountEmail: null, // You can optionally add an email here
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with your user's avatar URL
              ),
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
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 99, 187, 245),
        onPressed: () {
          debugPrint("You clicked floating action button");
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      body: Column(
        children: [
          buildSearchFunctionality(),
          Expanded(
            child: buildHomePage(),
          ),
        ],
      ),
    );
  }

  Widget buildSearchFunctionality() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 14.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: isDark,
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  icon: const Icon(Icons.filter_list_alt),
                  selectedIcon: const Icon(Icons.filter_alt_off_rounded),
                ),
              )
            ],
          );
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        }));
  }

  Widget buildHomePage() {
    return ListView.builder(
      itemCount: 20, // Assuming 20 items for demonstration
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header with user's profile picture and name
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Placeholder image
                      radius: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'User Name', // Replace with actual user name
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Post content
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'This is a brief description of the post.', // Replace with actual post content
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Post image
              Image.network(
                'https://via.placeholder.com/350x150', // Placeholder image
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              // Footer with action buttons and labels
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {},
                        ),
                        const Text('Like'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        const Text('Comment'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                        const Text('Share'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chat_bubble),
                          onPressed: () {},
                        ),
                        const Text('Message'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
