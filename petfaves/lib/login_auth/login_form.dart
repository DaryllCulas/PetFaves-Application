// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:petfaves/login_auth/modified_buttons.dart';
import 'package:petfaves/login_auth/sign_in_square_tile.dart';

import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/register_auth/register_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Variable to toggle password visibility

  Future<void> _handleGoogleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Obtain the auth details from the request
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Sign in with the credential
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to the next screen if login is successful
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetFeeds(),
          ),
        );
      }
    } catch (error) {
      // Handle sign-in error
      debugPrint("Error signing in with Google: $error");
      // Optionally, you can show a snackbar or dialog to inform the user about the error
    }
  }

  Future<void> _handleFacebookSignIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Handle Facebook sign-in success
      }
    } catch (error) {
      // Handle Facebook sign-in error
    }
  }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // Navigate to the next screen if login is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PetFeeds()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Dismiss loading dialog

      if (e.code == 'user-not-found') {
        debugPrint("User not found");
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        debugPrint("Invalid Password");
        wrongPasswordMessage();
      } else {
        debugPrint("Error occurred: ${e.message}");
        genericErrorMessage();
      }
    } catch (e) {
      debugPrint("Unexpected error occurred: $e");
      genericErrorMessage();
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
                  width: 600, // Adjust width as needed
                  height: 300, // Adjust height as needed
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 50.0, // Set a fixed height for the TextFormField
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Add border radius
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
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _obscureText = !_obscureText;
                          },
                        );
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
                  obscureText: _obscureText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Login Button
              ModifiedButtons(
                text: 'Login',
                onTap: signUserIn,
              ),
              const SizedBox(height: 30),

              // or continue with

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign in with Google Button
                  GestureDetector(
                    onTap: _handleGoogleSignIn,
                    child: const SquareTile(
                      imagePath: 'assets/google_icon.png',
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  // Sign in with Facebook Button
                  const SquareTile(imagePath: 'assets/facebook_icon.png'),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterPage(), // Or LoginPage() if in RegisterPage
                        ),
                      );
                    },
                    child: const Text(
                      'Register here',
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

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Incorrect Email'),
          content: const Text('Invalid Email or Password, Please try again!.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Incorrect Email or Password , Please try again!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
