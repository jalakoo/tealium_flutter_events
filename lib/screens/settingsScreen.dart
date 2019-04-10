import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ui.dart';
import '../models/appmodel.dart';
import '../utils/logger.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Settings"),
      ),
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
              ScopedModelDescendant<AppModel>(builder: (context, child, model) {
                log.verbose("settingsScreen: user: ${model.user.toString()}");
                return RoundedTextField("${model.user.email}", null);
              }),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ScopedModelDescendant<AppModel>(
                      builder: (context, child, model) {
                    return RoundedButton("Logout", context, () {
                      model.logout();
                      Navigator.popAndPushNamed(context, "launchController");
                    });
                  })),
            ],
          ))),
    ));
  }
}
