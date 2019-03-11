// JSON representation
// {
// 	"id": "_autogen_id_",
// 	"first_name": "John",
// 	"last_name": "Smith",
// 	"email": "john.smith@tealium.com",
// 	"company": "Tealium",
// 	"phone_numbers": {"mobile":"888-123-4567"},
// 	"notes": "",
// 	"utc_ts_updated": 1552229778
// }
class Contact {
  String id;
  String firstName;
  String lastName;
  String email;
  String company;
  PhoneNumbers phoneNumbers;
  String notes;
  int utcTsUpdated;

  Contact(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.phoneNumbers,
      this.notes,
      this.utcTsUpdated});

  Contact.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
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
    return data;
  }
}

class PhoneNumbers {
  String mobile;

  PhoneNumbers({this.mobile});

  PhoneNumbers.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    return data;
  }
}