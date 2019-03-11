import 'package:faker/faker.dart';

enum ItemManagerMode { file, random, prod }

// This class provides a list of events from a variety of different sources,
// dependent on the ItemManagerMode setting
class ItemsManager<T> {
  ItemManagerMode mode = ItemManagerMode.random;
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

  List<T> _new(ItemManagerMode currentMode) {
    switch (currentMode) {
      case ItemManagerMode.file:

        // Remove break to allow fallthrough
        break;
      case ItemManagerMode.random:
        return _getRandomly();
        break;
      case ItemManagerMode.prod:
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
