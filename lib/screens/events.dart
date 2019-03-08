import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () => {Navigator.pushNamed(context, "/contacts")}),
      ),
    );
  }
}
