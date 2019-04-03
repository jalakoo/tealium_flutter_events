import 'package:flutter/foundation.dart';
import 'contact.dart';

class User extends Contact {
  @required
  String authToken;
  DateTime lastSessionStart;

  User({this.authToken, this.lastSessionStart});

  User.fromJson(Map<String, dynamic> json) {
    Contact.fromJson(json);
    authToken = json['auth_token'];
    lastSessionStart = json['last_session_start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['auth_token'] = this.authToken;
    data['last_session_start'] = this.lastSessionStart;
    return data;
  }

  @override
  String toString() {
    return 'User {authToken: $authToken, lastSessionStart: $lastSessionStart}';
  }
}
