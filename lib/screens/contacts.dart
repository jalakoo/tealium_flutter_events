import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactsScreenState();
}

class ContactsScreenState extends State {
  List<Contact> contacts;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (contacts == null) {
      contacts = List<Contact>();
      getData();
    }
    return Scaffold(
      body: contactListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Create New Contact",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView contactListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.contacts[position].firstName +
                        " " +
                        this.contacts[position].lastName,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  this.contacts[position].company,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ));
        });
  }

  void getData() {
    List<Contact> contactsList = List<Contact>();
    Contact c1 =
        Contact("John", "Doe", "john.doe@teal.com", "Tealium", "555-123-4578");
    Contact c2 =
        Contact("Tim", "Cook", "tim.cook@teal.com", "Tealium", "555-123-4578");
    Contact c3 =
        Contact("Jet", "Li", "jet.li@teal.com", "Tealium", "555-123-4578");
    Contact c4 = Contact("Craig", "Daniel", "craig.daniel@tealium.com",
        "Tealium", "555-123-4578");
    contactsList.add(c1);
    contactsList.add(c2);
    contactsList.add(c3);
    contactsList.add(c4);

    setState(() {
      contacts = contactsList;
      count = contactsList.length;
    });
  }
}
