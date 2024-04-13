import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PetCareSection extends StatefulWidget {
  const PetCareSection({super.key});

  @override
  State<PetCareSection> createState() => _PetCareSectionState();
}

class _PetCareSectionState extends State<PetCareSection> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pet Care'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              // Define the list of text for each item
              List<String> itemText = [
                'Introduction to Pet Care',
                'Choosing the Right Pet',
                'Basic Pet Needs',
                'Pet Environment',
                'Behavior and Training',
                'Grooming and Hygiene',
              ];

              return InkWell(
                onTap: () {
                  // Navigate to appropriate screen here
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left part with avatar icon
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.pets),
                      ),
                      const SizedBox(width: 16),
                      // Right part with arrow icon
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemText[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
