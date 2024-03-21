import 'package:flutter/material.dart';
import 'package:petfaves/login_auth/login_form.dart';
import 'package:petfaves/register_auth/register_form.dart';

class LoginOrRegisterUser extends StatefulWidget {
  const LoginOrRegisterUser({super.key});

  @override
  State<LoginOrRegisterUser> createState() => _LoginOrRegisterUserState();
}

class _LoginOrRegisterUserState extends State<LoginOrRegisterUser> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginPage();
    } else {
      return const RegisterPage();
    }
  }
}
