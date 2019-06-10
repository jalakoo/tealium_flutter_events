import 'package:faker/faker.dart';
import 'httpManager.dart';
import 'sourceDataMode.dart';
import '../utils/logger.dart';

// This class provides a list of events from a variety of different sources,
// dependent on the SourceDataMode setting
class ItemsManager<T> {
  SourceDataMode mode = SourceDataMode.prod;
  List<T> _items;
  HttpManager _httpManager;

  Future<List<T>> getData() async {
    // TODO: Cache timeout
    // if (_items != null) {
    //   log.verbose("itemsManager: getData: returning cached items");
    //   return futureItems(_items);
    // }

    log.verbose("itemsManager: getData: getting new items");
    switch (mode) {
      case SourceDataMode.file:
        // Remove break to allow fallthrough
        // TODO:
        return futureItems([]);
        break;
      case SourceDataMode.random:
        log.verbose("itemsManager: getData: attempting to get random data...");
        return getRandomly().then((items) {
          _items = items;
          return futureItems(items);
        });
        break;
      case SourceDataMode.dev:
        log.verbose("itemsManager: getData: attempting to get dev data...");
        return getFromDev().then((items) {
          log.verbose("itemsManager: getData: items received: ${items}");
          _items = items;
          return futureItems(items);
        });
        break;
      case SourceDataMode.prod:
        // TODO:
        // return futureItems([]);
        log.verbose("itemsManager: getData: attempting to get prod data...");
        return getFromProd().then((items) {
          log.verbose("itemsManager: getData: items received: ${items}");
          _items = items;
          return futureItems(items);
        });
        break;
      default:
    }
  }

  Future<List<T>> futureItems(List<T> items) async {
    return Future.delayed(Duration(milliseconds: 100), () {
      return items;
    });
  }

  // Meant to be overwritten
  Future<List<T>> getRandomly() async {}

  // Meant to be overwritten
  T randomItem() {
    // TODO: T details
  }

  // Meant to be overwritten
  Future<List<T>> getFromFile(String filename) async {
    // TODO: Extract events from a JSON file
  }

  // Meant to be overwritten
  Future<List<T>> getFromDev() async {}

  // Meant to be overwritten
  Future<List<T>> getFromProd() async {}

  // UTILS
  HttpManager httpManager() {
    // Spin up an HttpManager instance if not already available
    if (_httpManager == null) {
      _httpManager = HttpManager();
    }
    // Set the httpManager mode to match the itemsManager mode
    _httpManager.mode = this.mode;
    return _httpManager;
  }
}
