class Contact {

  String _firstName;
  String _lastName;
  String _email;
  String _company;
  String _phoneNumber;
  String _notes;

  Contact(this._firstName, this._lastName, this._email, this._company, this._phoneNumber, [this._notes]);

  String get notes => _notes;

  set notes(String value) {
    _notes = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get company => _company;

  set company(String value) {
    _company = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }


}