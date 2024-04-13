import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/adminDashboard/admin_dashboard.dart';
import 'package:petfaves/homepage/highlights_screen.dart';
import 'package:petfaves/register_auth/login_or_register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late Stream<User?> _authStateStream;
  late StreamSubscription<User?> _streamSubscription;

  @override
  void initState() {
    super.initState();
    _authStateStream = FirebaseAuth.instance.authStateChanges();
    // Subscribe to the auth state stream
    _streamSubscription = _authStateStream.listen((user) {
      if (mounted) {
        setState(() {
          // Handle user authentication state change here
          if (user == null) {
            // User is not signed in, show the login or register page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOrRegisterUser(),
              ),
            );
          } else {
            // User is signed in, show the home page
            if (user.email == 'culasdaryll99@gmail.com' &&
                user.uid == 'TV4kJ7LyJKT4t1GOdCSwD7IZqDk1') {
              // Only show AdminDashboard for 'culasdaryll99@gmail.com' with the specified UID
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminDashboard(),
                ),
              );
            } else {
              // Show PetFeeds for other users
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HighLightsScreen(),
                ),
              );
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: _authStateStream,
        builder: (context, snapshot) {
          if (!mounted) {
            return Container(); // Return an empty container if widget is unmounted
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // User is signed in, the redirection will be handled in initState
            return Container();
          } else {
            // User is not signed in, show the login or register page
            return const LoginOrRegisterUser();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // Cancel the stream subscription when the widget is disposed
    _streamSubscription.cancel();
    super.dispose();
  }
}
