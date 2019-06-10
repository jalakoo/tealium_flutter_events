import 'package:scoped_model/scoped_model.dart';
import 'user.dart';
import '../managers/authManager.dart';
import '../utils/logger.dart';
import '../managers/fileManager.dart';
import '../managers/eventsManager.dart';
import '../managers/contactsManager.dart';
import '../managers/sourceDataMode.dart';
import '../managers/httpManager.dart';
import '../models/config.dart';
import 'dart:convert';

class AppModel extends Model {
  bool hasLoaded = false; // Not a big fan of this
  bool isLoading = false;
  User user;
  final String userFilename = "user.json";
  final String configFilename = "config.json";
  final AuthManager authManager = AuthManager();
  final EventsManager eventsManager = EventsManager();
  final ContactsManager contactsManager = ContactsManager();
  final FileManager fileManager = FileManager();
  final HttpManager httpManager = HttpManager();
  Config config;

  void load() async {
    isLoading = true;
    log.verbose("appmodel: load.");
    config = await loadModesFromBundle();
    await updateManagersTo(config);
    await loadUser();
  }

  // Future<Config> loadModes() async {
  //   try {
  //     String configString = await fileManager.read(configFilename);
  //     if (configString == null) {
  //       // Try loading from bundle
  //       return loadModesFromBundle();
  //     }
  //     final response = json.decode(configString);
  //     return Config.fromJson(response);
  //   } catch (e) {
  //     log.error("appModel: loadModes: ${e.toString()}");
  //     return loadModesFromBundle();
  //   }
  // }

  Future<Config> loadModesFromBundle() async {
    try {
      String configString = await fileManager.readFromBundle(configFilename);
      if (configString == null) {
        log.error("appModel: loadModesFromBundle: No config.json file found.");
        return null;
      }
      final response = json.decode(configString);
      return Config.fromJson(response);
    } catch (e) {
      log.error("appModel: loadModesFromBundle: ${e.toString()}");
      return null;
    }
  }

  void updateManagersTo(Config config) async {
    if (config == null) {
      log.verbose(
          "No config object loaded - running managers in default mode 'prod'.");
      // These actually should be already preset by the managers themselves
      authManager.mode = SourceDataMode.prod;
      eventsManager.mode = SourceDataMode.prod;
      contactsManager.mode = SourceDataMode.prod;
      httpManager.mode = SourceDataMode.prod;
      return;
    }
    if (config.authMode != null) {
      log.verbose(
          "appModel: updateManagersTo: authManager to mode: ${stringFromSourceDataMode(config.authMode)}");
      authManager.mode = config.authMode;
    }
    if (config.eventMode != null) {
      log.verbose(
          "appModel: updateManagersTo: eventsManager to mode: ${stringFromSourceDataMode(config.eventMode)}");
      eventsManager.mode = config.eventMode;
    }
    if (config.contactsMode != null) {
      log.verbose(
          "appModel: updateManagersTo: contactsManager to mode: ${stringFromSourceDataMode(config.contactsMode)}");
      contactsManager.mode = config.contactsMode;
    }
    if (config.httpMode != null) {
      log.verbose(
          "appModel: updateManagersTo: httpManager to mode: ${stringFromSourceDataMode(config.httpMode)}");
      httpManager.mode = config.httpMode;
    }
  }

  void loadUser() async {
    try {
      String userJsonString = await fileManager.read(userFilename);
      hasLoaded = true;
      isLoading = false;
      if (userJsonString != null) {
        final response = json.decode(userJsonString);
        this.user = User.fromJson(response);
        log.verbose(
            "appModel: loadUser: prior user loaded from memory: ${user.toString()}");
        notifyListeners();
        return null;
      }
      log.verbose("appModel: loadUser: No prior user found from memory.");
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
    AuthManager auth = authManager;
    auth.getUser(email, password).then((verifiedUser) {
      log.verbose(
          "appMode: login: User found for ${email}: ${verifiedUser.toString()}");
      saveUser(verifiedUser);
      this.user = verifiedUser;
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      log.verbose("appMode: login: Login failed for: ${email}");
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
    hasLoaded = false;
    user = null;
    fileManager.delete(userFilename);
    authManager.signOut();
    notifyListeners();
  }
}
