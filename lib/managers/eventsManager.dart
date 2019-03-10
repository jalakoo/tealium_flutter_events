import '../models/event.dart';
import 'managerMode.dart';
import 'package:faker/faker.dart';

// This class provides a list of events from a variety of different sources,
// dependent on the ManagerMode setting
class EventsManager {
  ManagerMode mode = ManagerMode.random;
  List<Event> _events;

  int count() {
    return events().length;
  }

  Event eventForIndex(int index) {
    return events()[index];
  }

  List<Event> events() {
    if (_events == null || _events.length == 0) {
      print('EventsManager: Generating new events');
      _events = _newEvents(mode);
    }
    return _events;
  }

  List<Event> _newEvents(ManagerMode currentMode) {
    switch (currentMode) {
      case ManagerMode.file:

        // Remove break to allow fallthrough
        break;
      case ManagerMode.random:
        print('EventsManager: Getting new random events');
        return _getEventsRandomly();
        break;
      case ManagerMode.prod:
        break;
      default:
    }
  }

  List<Event> _getEventsFromFile(String filename) {
    // TODO: Extract events from a JSON file
  }

  List<Event> _getEventsRandomly() {
    // Using faker library to populate content

    int numberOfEvents = Faker().randomGenerator.integer(10, min: 3);
    List<Event> result = List<Event>();
    for (var i = 0; i < numberOfEvents; i++) {
      result.add(_randomEvent());
    }
    print('EventsManager: Returning random events: ${result}');
    return result;
  }

  Event _randomEvent() {
    Event result = Event();
    Faker faker = Faker();
    result.name = faker.conference.name();

    // TODO: Event details
    return result;
  }

  List<Event> _getEventsFromProd() {
    // TODO: Get events from the producction server
  }
}
