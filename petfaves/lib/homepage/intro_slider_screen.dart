import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:petfaves/components/pet_preferences_questionnaire_form.dart';

class IntroScreenDefaultState extends StatefulWidget {
  const IntroScreenDefaultState({super.key});

  @override
  State<IntroScreenDefaultState> createState() =>
      _IntroScreenDefaultStateState();
}

class _IntroScreenDefaultStateState extends State<IntroScreenDefaultState> {
  List<ContentConfig> listContentConfig = [];
  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Fill out your Pet Preferences",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/chihuahua.png",
        backgroundColor: Color.fromARGB(255, 21, 133, 224),
        styleTitle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        maxLineTitle: 2,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Choose your pet based on your preferences",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/images/shepherd_dog.png",
        backgroundColor: Color.fromARGB(255, 45, 117, 42),
        styleTitle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        maxLineTitle: 2,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Set your appointment",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/tabby_kitten.png",
        backgroundColor: Color.fromARGB(255, 216, 140, 25),
        styleTitle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        maxLineTitle: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroSlider(
            key: UniqueKey(),
            listContentConfig: listContentConfig,
            onDonePress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PetPreferencesQuestionnaire(),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).primaryColor, // Adjust color as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
