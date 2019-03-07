import 'package:flutter/material.dart';
import '../ui.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        // ScrollView allows for UI to adjust if textfield is under keyboard
        body: SingleChildScrollView(
      // Almost all widgets have a child or children property to nest objects with
      child: Padding(
          padding: LoginPadding(context),
          child: Center(
              child: Column(
            children: <Widget>[
              ImageContainer("assets/tealium_logo_120x200.png"),
              Padding(padding: EdgeInsets.all(20.0)),
              RoundedTextField("Email"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: RoundedPasswordField("Password"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: RoundedButton(
                  "Login", 
                  context,
                  () => Navigator.pushNamed(context, "/events")),
              ),
            ],
          ))),
    ));
  }
}
