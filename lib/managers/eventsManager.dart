import 'itemsManager.dart';
import '../models/event.dart';
import 'package:faker/faker.dart';

class EventsManager extends ItemsManager {

@override
randomItem() {
    Event result = Event();
    Faker faker = Faker();
    
    result.name = faker.conference.name();

    // TODO: Event details
    return result;
  }
}
