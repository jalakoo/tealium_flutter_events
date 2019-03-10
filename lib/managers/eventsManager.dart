import '../models/event.dart';
import 'managerMode.dart';

// This class provides a list of events from a variety of different sources,
// dependent on the ManagerMode setting
class EventsManager {
  ManagerMode mode = ManagerMode.random;
  List<Event> events;

  Event eventForIndex(int index) {
    return events[index];
  }

  Event newEvents(ManagerMode currentMode) {
    switch (currentMode) {
      case ManagerMode.file:

        // Remove break to allow fallthrough
        break;
      case ManagerMode.random:
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
  }

  List<Event> _getEventsFromProd() {
    // TODO: Get events from the producction server
  }
}
