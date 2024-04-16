import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/adminDashboard/admin_account_settings.dart';
import 'package:petfaves/adminDashboard/admin_appointments.dart';
import 'package:petfaves/adminDashboard/admin_donation_screen.dart';
import 'package:petfaves/adminDashboard/admin_profile.dart';
import 'package:petfaves/adminDashboard/chatbot_customization_screen.dart';
import 'package:petfaves/adminDashboard/content_moderation.dart';
import 'package:petfaves/adminDashboard/manage_users_screen.dart';
import 'package:petfaves/adminDashboard/pet_list_records.dart';
import 'package:petfaves/adminDashboard/petmatchmaking_settings.dart';
import 'package:petfaves/login_auth/login_form.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  User? user;

  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    MessagesScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access currentUser during build method
    user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 212, 212),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 4.0,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: false, // This line removes the leading arrow
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 99, 187, 245),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user != null) ...[
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/200/300'),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      user!.email!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text('Manage Users'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ManageUsersScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Pet Matchmaking Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PetMatchMakingSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Appointments'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppointmentSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              title: const Text('Pet lists'),
              onTap: () {
                // Navigate to chatbot customization screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PetListRecords(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Donation Records'),
              onTap: () {
                // Navigate to chatbot customization screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminDonationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Chatbot Customization'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatbotCustomizationScreen(),
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
                    builder: (context) => const AccountSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Perform logout operation
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
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: const [
                  MetricCard(
                    title: 'Active Users',
                    number: '1000',
                    gradientColors: [Colors.blue, Colors.lightBlue],
                  ),
                  MetricCard(
                    title: 'Pets Adopted',
                    number: '100',
                    gradientColors: [Colors.green, Colors.lightGreen],
                  ),
                  MetricCard(
                    title: 'Pets Available',
                    number: '200',
                    gradientColors: [Colors.orange, Colors.deepOrange],
                  ),
                  MetricCard(
                    title: 'Donation',
                    number: '100000',
                    gradientColors: [Colors.purple, Colors.deepPurple],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const ContentModeration(),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  _controller.animateTo(
                    _controller.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String number;
  final List<Color> gradientColors;

  const MetricCard({
    super.key,
    required this.title,
    required this.number,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Messages Screen',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
