import 'package:flutter/material.dart';
import 'package:petfaves/components/modified_buttons.dart';
import 'package:petfaves/pet_adoption_process/setting_appointment.dart';

class PetAdoptionProcess extends StatefulWidget {
  const PetAdoptionProcess({super.key});

  @override
  State<PetAdoptionProcess> createState() => _PetAdoptionProcessState();
}

class _PetAdoptionProcessState extends State<PetAdoptionProcess> {
  final TextEditingController _petAdoptionFirstNameController =
      TextEditingController();
  final TextEditingController _petAdoptionLastNameController =
      TextEditingController();
  final TextEditingController _petAdoptionMiddleNameController =
      TextEditingController();
  final TextEditingController _petAdoptionContactNumberController =
      TextEditingController();
  final TextEditingController _petAdoptionEmailAddressController =
      TextEditingController();
  final TextEditingController _petAdoptionPetNickNameController =
      TextEditingController();
  final TextEditingController _petAdoptionPetTypeController =
      TextEditingController();
  final TextEditingController _petAdoptionHouseNoStreetController =
      TextEditingController();
  final TextEditingController _petAdoptionBarangayController =
      TextEditingController();
  final TextEditingController _petAdoptionCityMunicipalityController =
      TextEditingController();
  final TextEditingController _petAdoptionPetPostalZipCodeController =
      TextEditingController();
  bool _isBirdSelected = false;
  bool _isCatSelected = false;
  bool _isDogSelected = false;
  bool _isOtherSelected = false;
  int? _petAdoptionGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, right: 15.0, left: 15.0, bottom: 15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "First Name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionFirstNameController,
                labelText: "",
                height: 40.0,
                width: 210.0,
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last Name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionLastNameController,
                labelText: "",
                height: 40.0,
                width: 210.0,
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Middle Name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionMiddleNameController,
                labelText: "",
                height: 40.0,
                width: 210.0,
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionEmailAddressController,
                labelText: "example@gmail.com",
                height: 40.0,
                width: 300.0,
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact Number",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionContactNumberController,
                labelText: "",
                height: 40.0,
                width: 210.0,
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
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
                groupValue: _petAdoptionGender,
                onChanged: (value) {
                  if (value == null) {
                    debugPrint('RadioListTile value is null');
                    return;
                  }
                  setState(() {
                    _petAdoptionGender = value;
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
                groupValue: _petAdoptionGender,
                onChanged: (value) {
                  if (value == null) {
                    debugPrint('RadioListTile value is null');
                    return;
                  }
                  setState(() {
                    _petAdoptionGender = value;
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
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name of Pet you wish  to adopt*",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionPetNickNameController,
                labelText: "",
                height: 40.0,
                width: 210.0,
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pet Type",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
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
                    side: const BorderSide(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
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
                    side: const BorderSide(
                        color: Color.fromARGB(255, 65, 64, 64)),
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
                    side: const BorderSide(
                      color: Color.fromARGB(255, 65, 64, 64),
                    ),
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
                  controller: _petAdoptionPetTypeController,
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
              const SizedBox(height: 10.0),
              TextField(
                cursorColor: Colors.black,
                controller: _petAdoptionHouseNoStreetController,
                decoration: const InputDecoration(
                  labelText: "House No./Street",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                cursorColor: Colors.black,
                controller: _petAdoptionBarangayController,
                decoration: const InputDecoration(
                  labelText: "Barangay/Sitio/Purok",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                cursorColor: Colors.black,
                controller: _petAdoptionCityMunicipalityController,
                decoration: const InputDecoration(
                  labelText: "City/Municipality",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Postal/Zip Code",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              buildTextField(
                controller: _petAdoptionPetPostalZipCodeController,
                labelText: "",
                height: 40.0,
                width: 140.0,
              ),
              const SizedBox(height: 20.0),
              ModifiedButtons(
                onTap: submitPetAdoptionForm,
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    double height = 40.0,
    double? width, // Default height value
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: height,
      child: Row(
        children: [
          SizedBox(
            width: width,
            child: TextFormField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 80, 76, 76),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                fillColor: Colors.white70,
                filled: true,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitPetAdoptionForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Pet adoption form submitted successfully!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 84, 194, 88),
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingAppointment(),
      ),
    );
  }
}
