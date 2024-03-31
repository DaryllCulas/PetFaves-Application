import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petfaves/user_management/enum.dart';
import 'package:petfaves/user_management/model.dart';

class UserManagement {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> getCurrentUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userData =
            await _firestore.collection('users').doc(currentUser.uid).get();
        return User(
          id: currentUser.uid,
          email: currentUser.email ?? '',
          role: _parseRole(userData['role']),
        );
      }
    } catch (e) {
      print('Error getting user: $e');
    }
    return null;
  }

  UserRole _parseRole(String? role) {
    switch (role) {
      case 'admin':
        return UserRole.admin;
      case 'moderator':
        return UserRole.moderator;
      case 'user':
        return UserRole.user;
      default:
        return UserRole.user;
    }
  }
}
