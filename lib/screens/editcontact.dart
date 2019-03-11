import 'package:events/screens/contactdetail.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../ui.dart';




class EditContactScreen extends StatelessWidget {
  final Contact contact;
  const EditContactScreen({Key key, this.contact}) : super(key: key);
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
              Navigator.pop(context, MaterialPageRoute(builder: (context) => ContactDetailScreen(contact: this.contact,)),);
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
              RoundedContactTextField(contact.firstName, true),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField(contact.lastName, true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField(contact.email, true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField(contact.company, true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextField(contact.phoneNumber, true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: RoundedContactTextArea(contact.notes, true),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: RoundedBizCardButton(
                  "Scan Biz Card", 
                  context,
                  () => Navigator.pushNamed(context, "/events")), // Go to Biz Card Scanner Screen
              )
            ],
          ))),
    ));
  }
}
