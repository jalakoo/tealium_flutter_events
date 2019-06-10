import 'itemsManager.dart';
import '../models/event.dart';
import 'package:faker/faker.dart';
import 'dart:async' show Future;
import 'dart:convert';
import '../utils/logger.dart';

class EventsManager extends ItemsManager<Event> {
  @override
  randomItem() {
    Event result = Event();
    Faker faker = Faker();
    result.name = faker.conference.name();
    result.pardotUrl = faker.internet.httpsUrl();
    // result.lat = 32.715736;
    // result.lon = -117.161087;
    // result.address = faker.address.streetAddress() +
    //     ", " +
    //     faker.address.city() +
    //     ", " +
    //     faker.address.zipCode();
    // result.url = faker.internet.httpUrl();
    // result.utcStart =
    //     faker.randomGenerator.integer(1553226593, min: 1553226593);
    // int duration = 172800;
    // result.utcEnd = result.utcStart + duration;
    return result;
  }

  @override
  Future<List<Event>> getRandomly() async {
    // Using faker library to populate content
    log.verbose("eventsManager: getRandomly");

    int numberOf = Faker().randomGenerator.integer(10, min: 3);
    List<Event> result = List<Event>();
    for (var i = 0; i < numberOf; i++) {
      result.add(randomItem());
    }
    // return futureItems(result)
    return Future.delayed(Duration(milliseconds: 100), () {
      return result;
    });
  }

  // Using graphql endpoint
  @override
  Future<List<Event>> getFromDev() async {
    log.verbose("eventsManager: getFromDev.");
    String url = httpManager().baseUrlFor(mode);
    url += "/graphql";
    var data = {"query": "{Event{name, pardot_url}}"};
    log.verbose("eventsManager.js: getFromDev: url: ${url}");
    try {
      String responseBody = await httpManager().post(url, {}, data);
      log.verbose("eventsManager.js: getFromDev: response: ${responseBody}");
      Map m = json.decode(responseBody);
      List l = m["data"]["Event"];
      log.verbose("eventsManager.js: getFromDev: map: ${m}");
      log.verbose("eventsManager.js: getFromDev: list: ${l}");
      List<Event> result = List<Event>.from(l.map((i) => Event.fromJson(i)));
      return result;
    } catch (e) {
      log.error(e);
      return [];
    }
  }

  // Using
  // @override
  // Future<List<Event>> getFromDev() async {
  //   String url = httpManager().baseUrlFor(mode);
  //   url += "/events";
  //   String responseBody = await httpManager().get(url);
  //   List l = json.decode(responseBody);
  //   List<Event> result = List<Event>.from(l.map((i) => Event.fromJson(i)));
  //   return result;
  // }

  @override
  Future<List<Event>> getFromProd() async {
    log.verbose("eventsManager: getFromProd.");
    String url = httpManager().baseUrlFor(mode);
    url += "/graphql";
    var data = {"query": "{Event{name, pardot_url}}"};
    try {
      String responseBody = await httpManager().post(url, {}, data);
      Map m = json.decode(responseBody);
      List l = m["data"]["Event"];
      log.verbose("eventsManager.js: getFromProd: response: ${responseBody}");
      log.verbose("eventsManager.js: getFromProd: map: ${m}");
      log.verbose("eventsManager.js: getFromProd: list: ${l}");
      List<Event> result = List<Event>.from(l.map((i) => Event.fromJson(i)));
      return result;
    } catch (e) {
      log.error(e);
      return [];
    }
  }
}
