import 'managerMode.dart';
import 'package:faker/faker.dart';

// This class provides a list of events from a variety of different sources,
// dependent on the ManagerMode setting
class ItemsManager<T> {
  ManagerMode mode = ManagerMode.random;
  List<T> _items;

  int count() {
    return items().length;
  }

  T itemForIndex(int index) {
    return items()[index];
  }

  List<T> items() {
    if (_items == null || _items.length == 0) {
      _items = _new(mode);
    }
    return _items;
  }

  List<T> _new(ManagerMode currentMode) {
    switch (currentMode) {
      case ManagerMode.file:

        // Remove break to allow fallthrough
        break;
      case ManagerMode.random:
        return _getRandomly();
        break;
      case ManagerMode.prod:
        break;
      default:
    }
  }

  List<T> _getEventsFromFile(String filename) {
    // TODO: Extract events from a JSON file
  }

  List<T> _getRandomly() {
    // Using faker library to populate content

    int numberOf = Faker().randomGenerator.integer(10, min: 3);
    List<T> result = List<T>();
    for (var i = 0; i < numberOf; i++) {
      result.add(randomItem());
    }
    return result;
  }

  T randomItem() {
    // Meant to be overridden
    // TODO: T details
  }

  List<T> _getFromProd() {
    // TODO: Get events from the producction server
  }
}
