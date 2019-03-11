import 'itemsManager.dart';
import '../models/contact.dart';
import 'package:faker/faker.dart';

class ContactsManager extends ItemsManager {

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