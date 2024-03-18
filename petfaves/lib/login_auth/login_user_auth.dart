import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/register_auth/login_or_register.dart';

class AuthPage extends StatefulWidget {
  final Function()? onTap;
  const AuthPage({super.key, required this.onTap});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return PetFeeds(onTap: widget.onTap);
          } else {
            return const LoginOrRegisterUser();
          }
        },
      ),
    );
  }
}
