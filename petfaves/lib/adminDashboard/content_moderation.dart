import 'package:flutter/material.dart';

class ContentModeration extends StatefulWidget {
  const ContentModeration({Key? key});

  @override
  State<ContentModeration> createState() => _ContentModerationState();
}

class _ContentModerationState extends State<ContentModeration> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Content Moderation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10, // Example number of list items
              itemBuilder: (context, index) {
                return ElevatedCardListItem(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: 'Username ${index + 1}',
                  subtitle: 'Email Adress ${index + 1}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedCardListItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;

  const ElevatedCardListItem({
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 15,
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Color.fromARGB(255, 92, 91, 91)),
        ),
        tileColor: Colors.white,
        trailing: const Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }
}
