import 'package:events/screens/eventDetail.dart';
import 'package:flutter/material.dart';
import '../managers/eventsManager.dart';
import '../managers/sourceDataMode.dart';
import '../models/event.dart';

import 'package:scoped_model/scoped_model.dart';
import '../models/appmodel.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventsScreenState();
}

class EventsScreenState extends State {
  EventsManager events = EventsManager();

  @override
  Widget build(BuildContext context) {
    events.mode = SourceDataMode.random;

    return Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        body: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
          return FutureBuilder<List>(
              future: model.eventsManager.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? eventsListItems(snapshot.data)
                    : Center(
                        child: new CircularProgressIndicator(),
                      );
              });
        }));
    // body: FutureBuilder<List>(
    //   future: events.getData(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) print(snapshot.error);
    //     return snapshot.hasData
    //         ? eventsListItems(snapshot.data)
    //         : Center(
    //             child: new CircularProgressIndicator(),
    //           );
    //   },
    // ));
  }

  ListView eventsListItems(events) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: EventCard(events, index),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventDetailScreen(
                            event: events[index],
                          )),
                );
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
