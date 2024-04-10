import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petfaves/components/pet_preferences_questionnaire_form.dart';
import 'package:petfaves/components/user_notification.dart';
import 'package:petfaves/components/user_post_content.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({super.key});

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          key: UniqueKey(), // Add a unique key to the FloatingActionButton
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          backgroundColor: Colors.blue,
          child: Icon(
            _isExpanded ? Icons.close : Icons.menu,
            color: Colors.black,
          ),
        ),
        SizedBox(height: _isExpanded ? 10.0 : 0),
        if (_isExpanded) ...[
          FloatingActionButton.extended(
            heroTag: 'AnswerForm',
            onPressed: () {
              // Action for Answer Form icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PetPreferencesQuestionnaire(),
                ),
              );
            },
            backgroundColor: Colors.blue,
            icon: const Icon(
              FontAwesomeIcons.fileLines,
              color: Colors.black,
            ),
            label: const Text(
              'Fill out form',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton.extended(
            heroTag: 'PostSomething',
            onPressed: () {
              // Action for Post something icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserPostContent(),
                ),
              );
            },
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.post_add, color: Colors.black),
            label: const Text(
              'Post Something',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton.extended(
            heroTag: 'Notifications',
            onPressed: () {
              // Action for message icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserNotifications(),
                ),
              );
            },
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.notifications, color: Colors.black),
            label: const Text(
              'Notifications',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ],
    );
  }
}
