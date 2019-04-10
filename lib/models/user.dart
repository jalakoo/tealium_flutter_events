import 'package:flutter/foundation.dart';
import 'contact.dart';

class User extends Contact {
  @required
  String authToken;
  DateTime lastSessionStart;

  User({this.authToken, this.lastSessionStart});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    company = json['company'];
    phoneNumbers = json['phone_numbers'] != null
        ? new PhoneNumbers.fromJson(json['phone_numbers'])
        : null;
    notes = json['notes'];
    utcTsUpdated = json['utc_ts_updated'];
    authToken = json['auth_token'];
    lastSessionStart = json['last_session_start'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = super.toJson(); <-- sadly doesn't appear to work
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['company'] = this.company;
    if (this.phoneNumbers != null) {
      data['phone_numbers'] = this.phoneNumbers.toJson();
    }
    data['notes'] = this.notes;
    data['utc_ts_updated'] = this.utcTsUpdated;
    data['auth_token'] = this.authToken;
    data['last_session_start'] = this.lastSessionStart;
    return data;
  }

  @override
  String toString() {
    return 'User {authToken: $authToken, lastSessionStart: $lastSessionStart}, email: ${email}';
  }
}
