import 'package:events/screens/eventDetail.dart';
import 'package:flutter/material.dart';
import '../managers/eventsManager.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventsScreenState();
}

class EventsScreenState extends State {
  EventsManager events = EventsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: eventsListItems(),
    );
  }

  ListView eventsListItems() {
    return ListView.builder(
        itemCount: this.events.count(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: EventCard(index),
              onTap: () {
                //Navigator.pushNamed(context, "/eventDetail");
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen(event: this.events.itemForIndex(index),)),);
              });
        });
  }

  Card EventCard(int index) {
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
              this.events.itemForIndex(index).name,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
