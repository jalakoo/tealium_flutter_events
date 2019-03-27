import 'package:flutter/material.dart';
import '../ui.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ScrollView allows for UI to adjust if textfield is under keyboard
        body: SingleChildScrollView(
      // Almost all widgets have a child or children property to nest objects with
      child: Padding(
          padding: LoginPadding(context),
          child: Container(
            color: Colors.red,
            child: Center(
                child: Column(
              children: <Widget>[
                ImageContainer("assets/tealium_logo_120x200.png"),
                Padding(padding: EdgeInsets.all(20.0)),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: CircularProgressIndicator()),
              ],
            )),
          )),
    ));
  }
}
