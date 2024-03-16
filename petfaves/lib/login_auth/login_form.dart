import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/login_auth/sign_in_square_tile.dart';

// import 'package:petfaves/homepage/petfeeds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Variable to toggle password visibility

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Handle sign-in success (e.g., navigate to the home page)
    } catch (error) {
      // Handle sign-in error
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
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton.icon(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {
                    debugPrint("logged in");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PetFeeds(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign in with Google Button
                  SquareTile(
                    imagePath: 'assets/google_icon.png',
                  ),
                  SizedBox(width: 10.0),
                  // Sign in with Facebook Button
                  SquareTile(imagePath: 'assets/facebook_icon.png'),
                ],
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetFeeds(),
                    ),
                  );
                },
                child: const Text(
                  'Don\'t have an account? Register here',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
