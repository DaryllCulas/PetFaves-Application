import 'package:petfaves/user_management/enum.dart';
import 'package:petfaves/user_management/model.dart';

class RoleHandlers {
  static bool canEditContent(User user) {
    return user.role == UserRole.admin || user.role == UserRole.moderator;
  }

  static bool canDeleteContent(User user) {
    return user.role == UserRole.admin;
  }
}
