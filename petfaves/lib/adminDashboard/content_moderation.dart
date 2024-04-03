import 'package:flutter/material.dart';
import 'package:petfaves/adminDashboard/user_content_details.dart';

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
      elevation: 10,
      color: const Color.fromARGB(255, 255, 251, 251),
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
                  subtitle: 'See Details',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedCardListItem extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subtitle;

  const ElevatedCardListItem({
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ElevatedCardListItem> createState() => _ElevatedCardListItemState();
}

class _ElevatedCardListItemState extends State<ElevatedCardListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      elevation: 15,
      child: ListTile(
        leading: widget.leading,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          widget.subtitle,
          style: const TextStyle(color: Color.fromARGB(255, 92, 91, 91)),
        ),
        tileColor: Colors.white,
        trailing: IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {
            _showOptionsDialog(context, widget.title);
          },
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UsersContent(),
            ),
          );
        },
      ),
    );
  }
}

void _showOptionsDialog(BuildContext context, String username) {
  bool accept = false;
  bool decline = false;
  bool restrict = false;
  bool remove = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            title: Center(
              child: Text(
                '$username\'s content:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckboxListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.check_circle_outline), // Flutter icon
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text('Accept'),
                    ],
                  ),
                  value: accept,
                  onChanged: (bool? value) {
                    setState(() {
                      accept = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.cancel_outlined), // Flutter icon
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text('Decline'),
                    ],
                  ),
                  value: decline,
                  onChanged: (bool? value) {
                    setState(() {
                      decline = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.warning_amber_outlined), // Flutter icon
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text('Restrict'),
                    ],
                  ),
                  value: restrict,
                  onChanged: (bool? value) {
                    setState(() {
                      restrict = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.delete_outline), // Flutter icon
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text('Remove'),
                    ],
                  ),
                  value: remove,
                  onChanged: (bool? value) {
                    setState(() {
                      remove = value ?? false;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  'Confirm',
                  textAlign: TextAlign.left,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    },
  );
}
