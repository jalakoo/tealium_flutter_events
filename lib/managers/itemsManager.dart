import 'package:faker/faker.dart';
import 'httpManager.dart';

enum ItemsManagerMode { file, random, dev, prod }

// This class provides a list of events from a variety of different sources,
// dependent on the ItemsManagerMode setting
class ItemsManager<T> {
  ItemsManagerMode mode = ItemsManagerMode.random;
  List<T> _items;
  HttpManager _httpManager;

  Future<List<T>> getData() async {

    // TODO: Cache timeout
    if (_items != null){
      return futureItems(_items);
    }
    
    switch (mode) {
      case ItemsManagerMode.file:
        // Remove break to allow fallthrough
        // TODO:
        return futureItems([]);
        break;
      case ItemsManagerMode.random:
        return getRandomly().then((items){
          _items = items;
          return futureItems(items);
        });
        break;
      case ItemsManagerMode.dev:
        return getFromDev().then((items){
          _items = items;
          return futureItems(items);
        });
        break;
      case ItemsManagerMode.prod:
        // TODO:
        return futureItems([]);
        break;
      default:
    }
  }

  Future<List<T>> futureItems(List<T> items) async {
      return Future.delayed(Duration(milliseconds: 100), (){
        return items;
      });
  }

  // Meant to be overwritten
  Future<List<T>> getRandomly() async {

  }

  // Meant to be overwritten
  T randomItem() {
    // TODO: T details
  }

  // Meant to be overwritten
  Future<List<T>> getFromFile(String filename) async {
    // TODO: Extract events from a JSON file
  }

  // Meant to be overwritten
  Future<List<T>> getFromDev() async {

  }

  // Meant to be overwritten
  Future<List<T>> getFromProd() async {

  }

  // UTILS
  HttpManager httpManager() {
    // Spin up an HttpManager instance if not already available
    if (_httpManager == null){
      _httpManager =HttpManager();
    }
    // Set the httpManager mode to match the itemsManager mode
    _httpManager.mode =httpMode(this.mode);
    return _httpManager;
  }

  HttpManagerMode httpMode(ItemsManagerMode mode) {
    int modeInt = mode.index;
    return HttpManagerMode.values[modeInt];
  }
  
}
