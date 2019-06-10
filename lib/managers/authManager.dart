import 'dart:async';
import 'httpManager.dart';
import 'sourceDataMode.dart';
import 'package:faker/faker.dart';
import '../models/user.dart';
import '../utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

const String LOCAL_USERS = '...';

class AuthManager {
  SourceDataMode mode = SourceDataMode.prod;
  var currentUser = null;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  // Returns a user with a token or error if auth failed
  // This function is basically a router depending on the current mode
  Future<User> getUser(String email, String password) async {
    log.verbose("authManager: getUser.");
    if (mode == SourceDataMode.dev) {
      log.verbose("Getting user from dev...");
      return _getUserFromDev(email, password);
    }
    if (mode == SourceDataMode.file) {
      log.verbose("Getting user from file...");
      return _getUserFromFile(LOCAL_USERS, email, password);
    }
    if (mode == SourceDataMode.random) {
      log.verbose("Getting user randomly...");
      return _getUserRandomly();
    }
    log.verbose("Getting user from prod...");
    return _getUserFromProd(email, password);
  }

  Future<User> _getUserFromFile(
      String filename, String email, String password) async {
    // TODO: Read from actual file
    if (email != "t@t.com" && password != "123") {
      ArgumentError error = ArgumentError("Invalid credentials");
      throw error;
    }
    User result = User();
    result.id = "test";
    result.authToken = "abc123";
    result.firstName = "John";
    result.lastName = "Doe";
    result.email = "t@t.com";
    result.utcTsUpdated = 0;
    return Future.delayed(Duration(milliseconds: 100), () {
      return result;
    });
  }

  // Any login is going to work - you'll get a random token back, too.
  Future<User> _getUserRandomly() async {
    User result = User();
    Faker faker = Faker();
    result.authToken = faker.randomGenerator.string(8);
    result.email = faker.internet.email();
    return Future.delayed(Duration(milliseconds: 100), () {
      return result;
    });
  }

  Future<User> _getUserFromDev(String email, String password) async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      // Returns something like displayName: John Doe, email: john.doe@tealium.com, id: 102848407539020085946, photoUrl: https://lh6.googleusercontent.com/-uqtXGsj6z9A/AAABAAAAAAI/AAAABAAAAD4/7FXBf4yJ7mc/s1357/photo.jpg}
      // Convert GoogleSignInAccount to user
      log.verbose('authManager.dart: _getUserFromDev: google account');
      log.verbose(googleAccount.toString());
      final names = googleAccount.displayName.split(' ');
      User result = User();
      result.firstName = names[0];
      result.lastName = names[1];
      result.email = googleAccount.email;
      result.imageUrl = googleAccount.photoUrl;
      return result;
    } catch (error) {
      log.error(error);
    }
  }

  Future<User> _getUserFromProd(String email, String password) async {
    // throw UnimplementedError();
    try {
      final googleAccount = await _googleSignIn.signIn();
      // Returns something like displayName: John Doe, email: john.doe@tealium.com, id: 102848407539020085946, photoUrl: https://lh6.googleusercontent.com/-uqtXGsj6z9A/AAABAAAAAAI/AAAABAAAAD4/7FXBf4yJ7mc/s1357/photo.jpg}
      // Convert GoogleSignInAccount to user
      log.verbose('authManager.dart: _getUserFromProd: google account');
      log.verbose(googleAccount.toString());
      final names = googleAccount.displayName.split(' ');
      User result = User();
      result.firstName = names[0];
      result.lastName = names[1];
      result.email = googleAccount.email;
      result.imageUrl = googleAccount.photoUrl;
      return result;
    } catch (error) {
      log.error(error);
    }
  }

  Future<void> signOut() async {
    _googleSignIn.disconnect();
  }
}
