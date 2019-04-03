import 'package:scoped_model/scoped_model.dart';
import 'user.dart';
import '../managers/authManager.dart';
import '../utils/logger.dart';
import '../managers/fileManager.dart';
import 'dart:convert';

class AppModel extends Model {
  bool hasLoaded = false; // Not a big fan of this
  bool isLoading = false;
  User user;
  final String userFilename = "user.json";

  void load() async {
    FileManager fm = FileManager();
    isLoading = true;
    log.verbose("appmodel: load.");
    try {
      String userJsonString = await fm.read(userFilename);
      hasLoaded = true;
      isLoading = false;
      if (userJsonString != null) {
        final response = json.decode(userJsonString);
        this.user = User.fromJson(response);
        log.verbose("Prior user loaded from memory: ${user.toString()}");
        notifyListeners();
      }
      log.verbose("No prior user found from file.");
      notifyListeners();
      return null;
    } catch (e) {
      log.error("appModel: load: ${e.toString()}");
      hasLoaded = true;
      isLoading = false;
      notifyListeners();
    }
  }

  void login(String email, String password) {
    isLoading = true;
    AuthManager auth = AuthManager();
    auth.getUser(email, password).then((verifiedUser) {
      log.verbose("User found for ${email}");
      log.verbose("${verifiedUser.toString()}");
      saveUser(verifiedUser);
      this.user = verifiedUser;
      // FileManager fm = FileManager();
      // fm.write(json.encode(user), userFilename);
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      log.verbose("Login failed for: ${email}");
      isLoading = false;
      log.error("appModel: login: ${error.toString()}");
    });
  }

  void saveUser(User user) {
    log.verbose("appModel: saveUser.");
    FileManager fm = FileManager();
    try {
      fm.write(json.encode(user), userFilename);
      log.verbose("Saved user to file.");
    } catch (e) {
      log.error("appModel: saveUser: ${e.toString()}");
    }
  }

  void logout() {
    isLoading = false;
    user = null;
    notifyListeners();
  }
}
