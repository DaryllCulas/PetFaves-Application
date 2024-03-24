import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfaves/admin/admin_dashboard.dart';
import 'package:petfaves/homepage/petfeeds.dart';
import 'package:petfaves/register_auth/login_or_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

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
            // Check and authorize access
            authorizeAccess(context);
            // Returning a placeholder widget while authorization is in progress
            return const Center(child: CircularProgressIndicator());
          } else {
            return const LoginOrRegisterUser();
          }
        },
      ),
    );
  }

  Future<void> authorizeAccess(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Future.error('User not authenticated');
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('/admin')
          .doc('nwCQ1OBofuMzBMSxj5Ha') // Use the document ID here
          .get();

      if (querySnapshot.exists) {
        final userData = querySnapshot.data() as Map<String, dynamic>;
        final adminEmail = userData['email'] as String;
        final isAdmin = user.email == adminEmail;

        if (isAdmin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminDashboard()),
          );
          return Future.value();
        }
      }

      // If the user is not an admin, continue to the regular user screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PetFeeds()),
      );
    } catch (e) {
      // Handle errors gracefully
      debugPrint('Error authorizing access: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error authorizing access: $e'),
        ),
      );
    }
  }
}
