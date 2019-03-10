import 'package:flutter/material.dart';
import '../models/event.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventsScreenState();
}

class EventsScreenState extends State {
  List<Event> events;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (events == null) {
      events = List<Event>();
      getData();
    }
    return Scaffold(
      body: eventsListItems(),
    );
  }

  ListView eventsListItems() {
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
                    this.events[position].name,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ));
        });
  }

  void getData() {
    // List<Contact> contactsList = List<Events>();
    // Events c1 =
    //     Events("John", "Doe", "john.doe@teal.com", "Tealium", "555-123-4578");
    // Events c2 =
    //     Events("Tim", "Cook", "tim.cook@teal.com", "Tealium", "555-123-4578");
    // Events c3 =
    //     Events("Jet", "Li", "jet.li@teal.com", "Tealium", "555-123-4578");
    // Events c4 = Events("Craig", "Daniel", "craig.daniel@tealium.com",
    //     "Tealium", "555-123-4578");
    // contactsList.add(c1);
    // contactsList.add(c2);
    // contactsList.add(c3);
    // contactsList.add(c4);

    setState(() {
      // contacts = contactsList;
      // count = contactsList.length;
    });
  }
}
