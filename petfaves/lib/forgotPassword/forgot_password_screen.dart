import 'package:flutter/material.dart';
import 'package:petfaves/components/modified_buttons.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _confirmNewPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _obscureText = true;
  final _oldPasswordController = TextEditingController();

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 50.0,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        obscureText: isPassword ? _obscureText : false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: controller.text.isEmpty ? Colors.red : Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          if (!isPassword) {
            return null;
          }
          if (_newPasswordController.text !=
              _confirmNewPasswordController.text) {
            return 'Passwords don\'t match';
          }
          return null;
        },
      ),
    );
  }

  void confirmNewPassword() async {
    // Check if all text fields are not empty
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmNewPasswordController.text.isEmpty) {
      // Show error message if any of the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please fill in all fields',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return; // Stop further execution
    }

    try {
      if (_newPasswordController.text == _confirmNewPasswordController.text) {
        // Passwords match, navigate to login page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );

        // Reset password using Firebase Authentication
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: widget.emailController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Email for password reset has been sent successfully',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      } else {
        // Passwords don't match, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Passwords don\'t match',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } on Exception catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error: ${error.toString()}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
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
                  width: 600,
                  height: 200,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Let\'s reset password for you!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20.0),
              buildTextField(
                controller: widget.emailController,
                labelText: 'Email',
              ),
              buildTextField(
                controller: _oldPasswordController,
                labelText: 'Current Password',
                isPassword: true,
              ),
              buildTextField(
                controller: _newPasswordController,
                labelText: 'New Password',
                isPassword: true,
              ),
              buildTextField(
                controller: _confirmNewPasswordController,
                labelText: 'Confirm New Password',
                isPassword: true,
              ),
              const SizedBox(height: 15),
              ModifiedButtons(
                text: 'Confirm New Password',
                onTap: confirmNewPassword,
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Back to',
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
                      ' Login',
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
