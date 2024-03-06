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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          "images/LOGO PETFAVES.png",
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'PetFeeds',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
      body: buildHorizontalList(),
    );
  }

  Widget buildHorizontalList() {
    // ignore: sized_box_for_whitespace
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // automaticallyImplyLeading: false,
          actionsIconTheme: const IconThemeData(
            applyTextScaling: false,
          ),
          clipBehavior: Clip.none,
          shape: const StadiumBorder(),
          scrolledUnderElevation: 0.0,
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          floating: true,

          title: SearchAnchor.bar(
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<Widget>.generate(
                5,
                (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Initial list item $index'),
                  );
                },
              );
            },
          ),
        ),
        // The listed items below are just for filling the screen
        // so we can see the scrolling effect.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 100.0,
                    child: Card(
                      child: Center(child: Text('Card $index')),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 1000,
              color: Colors.deepPurple.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
