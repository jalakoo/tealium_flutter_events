import 'package:events/models/event.dart';
import 'package:events/screens/editcontact.dart';
import 'package:events/ui.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
        double c_width = MediaQuery.of(context).size.width*0.5;
        return Scaffold(
            appBar: AppBar(
            //backgroundColor: Color(0xff01A0C7),
            actions: <Widget>[
              // create contact action
              IconButton(
                icon: new Icon(Icons.contacts),
                onPressed: () {
                  Navigator.pushNamed(context, "/contacts");
                })
            ],
            title: const Text("Event Detail"),
          ),
          body: Center(
            child: Column(
            children: <Widget>[                
            Padding(padding: EdgeInsets.all(15.0)),
            Text("14-15 May 2019"),
            //Text(event.utcTsStart.toString() + " - " + event.utcTsEnd.toString()),  // TODO: Convert date - https://docs.flutter.io/flutter/intl/DateFormat/DateFormat.html
            Padding(padding: EdgeInsets.all(15.0)),
            ImageContainer("assets/tealium_logo_120x200.png"),  // TODO: Add maps - https://pub.dartlang.org/packages/google_maps_flutter
            Padding(padding: EdgeInsets.all(20.0)),
            //Text(event.address),
            WrappedText(c_width, "11095 Torreyana Rd., San Diego, CA 92121"),
            Padding(padding: EdgeInsets.all(15.0)),
            //Text(event.url)
            GestureDetector(
              child: Text("www.cdao-contact.com", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: () {
                // onTap action - launch url - https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/gallery/about.dart
              }
            ),
          ],
        ),
      ),
    );
  }
}
