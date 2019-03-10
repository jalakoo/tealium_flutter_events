import 'package:flutter/material.dart';
//import '../models/contact.dart';
import '../ui.dart';

class EditContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff01A0C7),
        actions: <Widget>[
          // save action
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Save"),)
        ],
        title: const Text("CDAO | Contact"),
      ),
        // ScrollView allows for UI to adjust if textfield is under keyboard
        body: SingleChildScrollView(
      // Almost all widgets have a child or children property to nest objects with
      child: Padding(
          padding: ContactDetailsPadding(context),
          child: Center(
              child: Column(
            children: <Widget>[
              ImageContainer("assets/user.png"),
              Padding(padding: EdgeInsets.all(10.0)),
              RoundedContactTextField("First Name"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField("Last Name"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField("Email"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField("Company"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField("Phone Number"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextArea("Notes"),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: RoundedBizCardButton(
                  "Scan Biz Card", 
                  context,
                  () => Navigator.pushNamed(context, "/events")),)
            ],
          ))),
    ));
  }
}
