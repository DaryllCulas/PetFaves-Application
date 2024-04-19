import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/components/modified_buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();

// TODO: Modify this function that can automatically stored the data in both firebase authentication and cloud firestore

  Future<void> signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      showSnackBar(context, 'Passwords don\'t match');
      return;
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final userId = userCredential.user?.uid;

      if (userId != null) {
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'email': _emailController.text,
        });

        showLoadingDialog(context);
        dismissLoadingDialog(context);
        navigateToLoginPage(context);
        showSnackBar(context, 'Account Registered');
      } else {
        throw FirebaseAuthException(
            code: 'user-id-null',
            message: 'User ID is null after registration');
      }
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e, context);
    } catch (e) {
      handleUnexpectedException(e, context);
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green.shade300,
      content: Text(message, style: const TextStyle(color: Colors.white)),
    ));
  }

  void handleFirebaseAuthException(
      FirebaseAuthException e, BuildContext context) {
    if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'Email already in use');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade300,
          content: Text(e.message ?? 'An error occurred'),
        ),
      );
    }
  }

  void handleUnexpectedException(Object e, BuildContext context) {
    debugPrint('Unexpected error occurred: $e');
    showSnackBar(context, 'An error occurred');
  }

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email';
          }
          // Check if email is valid
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

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

  void genericErrorMessage() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'An unexpected error occurred. Please try again later.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('OK'),
            ),
          ],
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
                  'assets/images/LOGO PETFAVES.png',
                  width: 600,
                  height: 200,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20.0),
              buildTextField(
                controller: _emailController,
                labelText: 'Email',
              ),
              buildTextField(
                controller: _passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              buildTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                isPassword: true,
              ),
              const SizedBox(height: 15),
              ModifiedButtons(
                text: 'Sign up',
                onTap: signUp,
              ),
              const SizedBox(height: 30),
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
