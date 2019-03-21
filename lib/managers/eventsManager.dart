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

      // TODO: Event details
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
    return Future.delayed(Duration(milliseconds: 100), (){
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

