import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:events/models/event.dart';
import 'package:events/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  final Set<Marker> _markers = {};
  final Event event;
  EventDetailScreen({Key key, this.event}) : super(key: key);
  Completer<GoogleMapController> _controller = Completer();

// Should all these methods go in a seperate file?
  Future<void> _onLinkClick(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _createMarkers(LatLng location) {
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(location.toString()),
      position: location,
      infoWindow: InfoWindow(
          //title: event.name,
          title: "test event",
          //snippet: event.address,
          snippet: "test snippet"),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  String _displayDate(int start, int end) {
    List<String> startDate = _formattedDate(start);
    List<String> endDate = _formattedDate(end);
    String multiMonth = "";
    String multiYear = "";
    if (startDate[0] != endDate[0]) {
      multiMonth = " " + startDate[0];
    }
    if (startDate[2] != endDate[2]) {
      multiYear = " " + startDate[2];
    }
    return startDate[1] + multiMonth + multiYear + " - " + endDate[1] + " " + endDate[0] + " " + endDate[2];
  }

  List<String> _formattedDate(int timestamp) {
    List<String> datePieces = new List();
    datePieces = DateFormat('MMM/dd/yyyy')
        .format(new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .split('/');
    return datePieces;
  }
  // [end] Should all these methods go in a seperate file?

  @override
  Widget build(BuildContext context) {
    double text_width = MediaQuery.of(context).size.width * 0.5;
    // LatLng _location = new LatLng(event.lat, event.lon);
    LatLng _location =
        new LatLng(32.709583, -117.1598837); // [stub] lat/lon for now
    _createMarkers(_location);
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
            // Text(_displayDate(event.utcTsStart,event.utcTsEnd)),
            Text(_displayDate(1554109200, 1554224400)), // [stub] start/end for now
            Padding(padding: EdgeInsets.all(15.0)),
            new Container(
              height: 200,
              width: 350,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _location,
                  zoom: 11.0,
                ),
                markers: _markers,
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            // WrappedText(text_width, event.address),
            WrappedText(text_width,
                "11095 Torreyana Rd.\n San Diego, CA 92121"), // [stub] address for now
            Padding(padding: EdgeInsets.all(15.0)),
            // Linkify(
            //   onOpen: _onLinkClick,
            //   text: event.url,
            // ),
            Linkify(
              onOpen: _onLinkClick,
              text: "https://www.google.com", // [stub] url for now
            ),
          ],
        ),
      ),
    );
  }
}
