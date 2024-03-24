import 'package:flutter/material.dart';
import 'package:petfaves/components/modified_buttons.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController _firstNameDPController = TextEditingController();
  final TextEditingController _lastNameDPController = TextEditingController();
  final TextEditingController _emailAddressDPController =
      TextEditingController();
  final TextEditingController _amountToDonateController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Donation Form'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/LOGO PETFAVES.png',
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _firstNameDPController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 102, 99, 99),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _lastNameDPController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 102, 99, 99),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _emailAddressDPController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 102, 99, 99),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: TextField(
                controller: _amountToDonateController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Amount to donate',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 102, 99, 99),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _commentsController,
                cursorColor: Colors.black,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 102, 99, 99),
                  ),
                  prefixIcon: const SizedBox(
                      width: 120.0), // Transparent icon to occupy space
                  suffixIcon: const SizedBox(width: 100.0),
                  contentPadding: const EdgeInsets.symmetric(vertical: 50.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ModifiedButtons(
                onTap: submitDonation,
                text: 'Submit Donation',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitDonation() {
    // Perform actions to submit donation
    String firstName = _firstNameDPController.text;
    String lastName = _lastNameDPController.text;
    // Add additional logic to handle donation submission
    debugPrint('Submitting donation for $firstName $lastName');
    // Optionally, you can show a confirmation dialog or navigate to a success screen.
  }
}
