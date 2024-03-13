import 'package:flutter/material.dart';

class BuildHomePage extends StatefulWidget {
  const BuildHomePage({super.key});

  @override
  State<BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<BuildHomePage> {
  @override
  Widget build(BuildContext context) {
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
