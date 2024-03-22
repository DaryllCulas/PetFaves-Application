// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/login_auth/login_form.dart';

import 'package:petfaves/login_auth/modified_buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Register user method
    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to the next screen after successful registration
        Navigator.pop(context); // Dismiss the loading dialog
        Navigator.pushReplacement(
          // Replace the current route with the next one
          context,
          MaterialPageRoute(
            builder: (context) => const PetFeeds(),
          ),
        );
      } else {
        // Show error message if passwords don't match
        wrongPasswordMessage("Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      // Show error message for Firebase Auth exceptions
      if (e.code == 'weak-password') {
        wrongPasswordMessage("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        wrongEmailMessage("The account already exists for that email");
      }
    } catch (e) {
      // Show generic error message for other exceptions
      genericErrorMessage();
    }

    Navigator.pop(context); // Dismiss loading dialog
  }

  // Method to show wrong email message
  void wrongEmailMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade200,
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  // Method to show wrong password message
  void wrongPasswordMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade200,
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  // Method to show generic error message
  void genericErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade200,
          title: const Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: const Text(
            'An unexpected error occurred. Please try again later.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/LOGO PETFAVES.png',
                  width: 600, // Adjust width as needed
                  height: 200, // Adjust height as needed
                ),
              ),
              const SizedBox(height: 10.0),
              // let's create an account for you!
              const Text(
                'let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 40.0, // Set a fixed height for the TextFormField
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: Colors.black,
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: _obscurePassword,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: Colors.black,
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: _obscureConfirmPassword,
                ),
              ),
              const SizedBox(height: 15),
              // Sign Up Button
              ModifiedButtons(
                text: 'Sign up',
                onTap: signUserUp,
              ),
              const SizedBox(height: 30),

              const SizedBox(height: 30.0),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      ' Login here',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
