import 'package:flutter/material.dart';

class PetPreferencesQuestionnaire extends StatefulWidget {
  const PetPreferencesQuestionnaire({Key? key}) : super(key: key);

  @override
  State<PetPreferencesQuestionnaire> createState() =>
      _PetPreferencesQuestionnaireState();
}

class _PetPreferencesQuestionnaireState
    extends State<PetPreferencesQuestionnaire> {
  final TextEditingController _ageController = TextEditingController();
  bool _isBirdSelected = false;
  bool _isCatSelected = false;
  bool _isDogSelected = false;
  bool _isLarge = false;
  bool _isMedium = false;
  bool _isOtherSelected = false;
  bool _isSmall = false;
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _otherPetTypeController = TextEditingController();
  int _petAgePreference = -1;
  int? _petGenderPreference;
  int? _lifeStyleCompatibility;
  int? _livingSituation;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _occupationController.dispose();
    _otherPetTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Preferences Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 64, 64),
                ),
              ),
              TextField(
                cursorColor: Colors.black,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "What's your complete name?",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 65, 64, 64),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                cursorColor: Colors.black,
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'How old are you?',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 65, 64, 64),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                cursorColor: Colors.black,
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Where do you live?',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 65, 64, 64),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                cursorColor: Colors.black,
                controller: _occupationController,
                decoration: const InputDecoration(
                  labelText: 'What do you do for living?',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 65, 64, 64),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Pet type',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 64, 64),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isDogSelected,
                    onChanged: (value) {
                      setState(() {
                        _isDogSelected = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Dog',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isCatSelected,
                    onChanged: (value) {
                      setState(() {
                        _isCatSelected = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Cat',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isBirdSelected,
                    onChanged: (value) {
                      setState(() {
                        _isBirdSelected = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Bird',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isOtherSelected,
                    onChanged: (value) {
                      setState(() {
                        _isOtherSelected = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Others',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              if (_isOtherSelected)
                TextField(
                  controller: _otherPetTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Please specify',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              const SizedBox(height: 30.0),
              const Text(
                'Preferred Pet Size',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 64, 64),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isSmall,
                    onChanged: (value) {
                      setState(() {
                        _isSmall = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Small',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isMedium,
                    onChanged: (value) {
                      setState(() {
                        _isMedium = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Medium',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(color: Colors.black),
                    activeColor: Colors.blue,
                    value: _isLarge,
                    onChanged: (value) {
                      setState(() {
                        _isLarge = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Large',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pet Age Preferences:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      '0–11 months old',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 0,
                    groupValue: _petAgePreference,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _petAgePreference = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      '1-3 years old',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 1,
                    groupValue: _petAgePreference,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _petAgePreference = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      '4 years and older',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 2,
                    groupValue: _petAgePreference,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _petAgePreference = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Pet Gender Preferred:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Male',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 0,
                    groupValue: _petGenderPreference,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _petGenderPreference = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Female',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 1,
                    groupValue: _petGenderPreference,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _petGenderPreference = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'LifeStyle Compatibility',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Active and Outdoors',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 0,
                    groupValue: _lifeStyleCompatibility,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _lifeStyleCompatibility = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Relaxed and Indoors',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 1,
                    groupValue: _lifeStyleCompatibility,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _lifeStyleCompatibility = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Flexible and can adapt',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 2,
                    groupValue: _lifeStyleCompatibility,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _lifeStyleCompatibility = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Living Situation',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'House with a yard',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 0,
                    groupValue: _livingSituation,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _livingSituation = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Apartment/Condo ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 1,
                    groupValue: _livingSituation,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _livingSituation = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Rural Area',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 2,
                    groupValue: _livingSituation,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _livingSituation = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Urban Area',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    value: 3,
                    groupValue: _livingSituation,
                    onChanged: (value) {
                      if (value == null) {
                        debugPrint('RadioListTile value is null');
                        return;
                      }
                      setState(() {
                        _livingSituation = value;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          debugPrint('RadioListTile is disabled');
                        }
                        return const Color.fromARGB(255, 65, 64, 64);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
