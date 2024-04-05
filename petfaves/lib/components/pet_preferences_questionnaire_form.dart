import 'package:flutter/material.dart';

class PetPreferencesQuestionnaire extends StatefulWidget {
  const PetPreferencesQuestionnaire({super.key});

  @override
  State<PetPreferencesQuestionnaire> createState() =>
      _PetPreferencesQuestionnaireState();
}

class _PetPreferencesQuestionnaireState
    extends State<PetPreferencesQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Preferences Questionnaire'),
      ),
      body: const Center(
        child: Text(
          'Pet Preferences Questionnaire Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
