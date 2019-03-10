import 'package:events/screens/editcontact.dart';
import 'package:flutter/material.dart';
//import '../models/contact.dart';
import '../ui.dart';

class ContactDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff01A0C7),
        actions: <Widget>[
          // back action
          IconButton(
            icon: new Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditContactScreen()),);
            })
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
                // Need this for edit contacts, keeping for reference
                // child: RoundedButton(
                //   "Login", 
                //   context,
                //   () => Navigator.pushNamed(context, "/events")),
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
            ],
          ))),
    ));
  }
}
