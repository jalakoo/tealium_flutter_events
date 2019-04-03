import 'package:flutter/material.dart';
import 'contactDetailScreen.dart';
import '../managers/contactsManager.dart';
import '../models/contact.dart';

class ContactsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactsScreenState();
}

class ContactsScreenState extends State {
  ContactsManager contacts = ContactsManager();
  // List<Contact> contacts;
  // int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List>(
        future: contacts.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? contactListItems(snapshot.data)
              : Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Create New Contact",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView contactListItems(List<Contact> contacts) {
    return ListView.builder(
        itemCount: contacts.length,
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
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactDetailScreen(
                                  contact: contacts[position],
                                )),
                      );
                    },
                    child: Text(
                      contacts[position].firstName +
                          " " +
                          contacts[position].lastName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Text(
                  contacts[position].company,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ));
        });
  }
}
