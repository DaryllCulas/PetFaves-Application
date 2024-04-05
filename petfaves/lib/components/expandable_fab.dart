import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpandableFab extends StatefulWidget {
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
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          backgroundColor: Colors.blue,
          child: Icon(
            _isExpanded ? Icons.close : FontAwesomeIcons.pencil,
            color: Colors.black,
          ),
        ),
        SizedBox(height: _isExpanded ? 10.0 : 0),
        if (_isExpanded) ...[
          FloatingActionButton.extended(
            onPressed: () {
              // Action for Answer Form icon
            },
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            label: const Text(
              'Answer Form',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton.extended(
            onPressed: () {
              // Action for Post something icon
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
            onPressed: () {
              // Action for message icon
            },
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.message, color: Colors.black),
            label: const Text(
              'Message',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ],
    );
  }
}
