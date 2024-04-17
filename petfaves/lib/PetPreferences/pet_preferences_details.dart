import 'package:flutter/material.dart';
import 'package:petfaves/components/pet_preferences_questionnaire_form.dart';

class PetPreferences extends StatefulWidget {
  const PetPreferences({super.key});

  @override
  State<PetPreferences> createState() => _PetPreferencesState();
}

class _PetPreferencesState extends State<PetPreferences> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PetPreferencesQuestionnaire(),
    );
  }
}
