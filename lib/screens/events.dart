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
      // body: Center(
      //   child: RaisedButton(onPressed: () {
      //     Navigator.pushNamed(context, "/eventDetails");
      //   }),
      // ),
    );
  }

  ListView eventsListItems() {
    return ListView.builder(
        itemCount: this.events.count(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: EventCard(index),
              onTap: () {
                Navigator.pushNamed(context, "/eventDetail");
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
              this.events.eventForIndex(index).name,
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
  // ListView eventsListItems() {
  //   return ListView.builder(
  //       itemCount: this.events.count(),
  //       itemBuilder: (BuildContext context, int position) {
  //         return Card(
  //             child: Padding(
  //           padding: const EdgeInsets.only(
  //             top: 8.0,
  //             bottom: 8.0,
  //             left: 64.0,
  //           ),
  //           child: Row(
  //             children: <Widget>[
  //               Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   this.events.eventForIndex(position).name,
  //                   textAlign: TextAlign.right,
  //                   style: TextStyle(
  //                     color: Colors.blue,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ));
  //       });
  // }

}
