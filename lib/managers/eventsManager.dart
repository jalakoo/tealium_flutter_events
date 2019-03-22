import 'itemsManager.dart';
import '../models/event.dart';
import 'package:faker/faker.dart';
import 'dart:async' show Future;
import 'dart:convert';

class EventsManager extends ItemsManager {
  @override
  randomItem() {
    Event result = Event();
    Faker faker = Faker();
    result.name = faker.conference.name();

    result.lat = 32.715736;
    result.lon = -117.161087;
    result.address = faker.address.streetAddress() +
        ", " +
        faker.address.city() +
        ", " +
        faker.address.zipCode();
    result.url = faker.internet.httpUrl();
    result.utcStart =
        faker.randomGenerator.integer(1553226593, min: 1553226593);
    int duration = 172800;
    result.utcEnd = result.utcStart + duration;
    return result;
  }

  @override
  Future<List<Event>> getRandomly() async {
    // Using faker library to populate content

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

  @override
  Future<List<Event>> getFromDev() async {
    String url = httpManager().baseUrlFor(httpMode(mode));
    url += "/events";
    String responseBody = await httpManager().get(url);
    List l = json.decode(responseBody);
    List<Event> result = List<Event>.from(l.map((i) => Event.fromJson(i)));
    return result;
  }
}
