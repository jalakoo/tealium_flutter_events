import 'package:events/screens/eventDetail.dart';
import 'package:flutter/material.dart';
import '../managers/eventsManager.dart';
import '../managers/itemsManager.dart'; // This is terrible, need to import to access the mode enum!?
import '../models/event.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventsScreenState();
}

class EventsScreenState extends State {
  EventsManager events = EventsManager();
  
  @override
  Widget build(BuildContext context) {
    events.mode = ItemsManagerMode.dev;

    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: FutureBuilder<List>(
        future: events.getData(),
        builder: (context, snapshot) {
          // print("Events: FutureBuilder: snapshot:");
          // print(snapshot);
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? eventsListItems(snapshot.data) : Center( child: new CircularProgressIndicator(),);
        },
      )
      );
  }

  ListView eventsListItems(events) {
    // print("eventsListItems:");
    // print(events);
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: EventCard(events, index),
              onTap: () {
                //Navigator.pushNamed(context, "/eventDetail");
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen(event: this.events.itemForIndex(index),)),);
              });
        });
  }

  Card EventCard(List<Event> events, int index) {
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
              events[index].name,
              // events.itemForIndex(index).name,
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
