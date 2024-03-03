import 'package:flutter/material.dart';

class PracticeLayoutHere extends StatelessWidget {
  const PracticeLayoutHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('Sample'),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 10.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Images",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2),
            label: "Shop",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("You clicked this");
        },
        backgroundColor: Colors.black,
        hoverColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/brook.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/chopper.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/eggheadArc.jpg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/franky.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/gear5luffy.jpeg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/jimbei.jpeg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/nami.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/nicoRobin.jpg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/sanji.jpeg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/usopp.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/wanoArc.jpg',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/zoro.png',
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
