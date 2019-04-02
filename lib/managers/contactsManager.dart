import 'itemsManager.dart';
import '../models/contact.dart';
import 'package:faker/faker.dart';

class ContactsManager extends ItemsManager {
  @override
  Future<List<Contact>> getRandomly() async {
    // Using faker library to populate content
    int numberOf = Faker().randomGenerator.integer(10, min: 3);
    List<Contact> result = List<Contact>();
    for (var i = 0; i < numberOf; i++) {
      result.add(randomItem());
    }
    return Future.delayed(Duration(milliseconds: 100), () {
      return result;
    });
  }

  @override
  randomItem() {
    Contact result = Contact();
    Faker faker = Faker();
    result.firstName = faker.person.firstName();
    result.lastName = faker.person.lastName();
    result.email = faker.internet.email();
    result.company = faker.company.name();
    PhoneNumbers phoneNumbers = PhoneNumbers();
    phoneNumbers.mobile = faker.randomGenerator.fromPattern(["###-###-####"]);
    result.phoneNumbers = phoneNumbers;
    return result;
  }
}
