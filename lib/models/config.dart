import '../managers/sourceDataMode.dart';

class Config {
  SourceDataMode authMode;
  SourceDataMode eventMode;
  SourceDataMode contactsMode;

  Config({this.authMode, this.eventMode, this.contactsMode});

  Config.fromJson(Map<String, dynamic> json) {
    String authModeString = json['auth_mode'];
    authMode = sourceDataModeFrom(authModeString);

    String eventModeString = json['events_mode'];
    eventMode = sourceDataModeFrom(eventModeString);

    String contactsModeString = json['contacts_mode'];
    contactsMode = sourceDataModeFrom(contactsModeString);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_mode'] = stringFromSourceDataMode(this.authMode);
    data['events_mode'] = stringFromSourceDataMode(this.eventMode);
    data['contacts_mode'] = stringFromSourceDataMode(this.contactsMode);
  }
}
