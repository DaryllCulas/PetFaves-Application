import 'package:petfaves/user_management/enum.dart';

class User {
  late String id;
  late String email;
  late UserRole role;

  User({
    required this.id,
    required this.email,
    required this.role,
  });
}
