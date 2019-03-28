import 'dart:async';
import 'httpManager.dart';
import 'sourceDataMode.dart';
import 'package:faker/faker.dart';
import '../models/user.dart';
import '../utils/logger.dart';

const String LOCAL_USERS = '...';

class AuthManager {
  SourceDataMode mode = SourceDataMode.random;

// Returns a user with a token or error if auth failed
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
    return Future.delayed(Duration(milliseconds: 100), () {
      return result;
    });
  }

  Future<User> _getUserFromDev(String email, String password) async {
    throw UnimplementedError();
  }

  Future<User> _getUserFromProd(String email, String password) async {
    throw UnimplementedError();
  }
}
