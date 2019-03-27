import 'package:scoped_model/scoped_model.dart';
import 'user.dart';
import '../managers/authManager.dart';
import '../utils/logger.dart';

class AppModel extends Model {
  bool isLoading = false;
  User user;

  void login(String email, String password) {
    isLoading = true;
    AuthManager auth = AuthManager();
    auth.getUser(email, password).then((verifiedUser) {
      log.verbose("User found for ${email}");
      user = verifiedUser;
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      log.verbose("Login failed for: ${email}");
      isLoading = false;
      log.error(error.toString());
    });
  }

  void logout() {
    isLoading = false;
    user = null;
    notifyListeners();
  }
}
