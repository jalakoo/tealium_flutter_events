import 'package:flutter/material.dart';
import 'ui.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: null,
        body: Padding(
            padding: LoginPadding(context),
            child: Center(
                child: Column(
              children: <Widget>[
                ImageContainer("assets/tealium_logo_120x200.png"),
                Padding(padding: EdgeInsets.all(20.0)),
                RoundedTextField("Email"),
                Padding(padding: EdgeInsets.all(8.0)),
                RoundedPasswordField("Password"),
                Padding(padding: EdgeInsets.all(8.0)),
                RoundedButton("Login", context),
              ],
            ))));
  }
}
