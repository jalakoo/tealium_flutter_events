import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ui.dart';
import '../models/appmodel.dart';

class LoginScreen extends StatelessWidget {
  AppModel model;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ImageContainer("assets/tealium_logo_120x200.png"),
              Padding(padding: EdgeInsets.all(20.0)),
              // RoundedTextField("Email", emailController),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              //   child: RoundedPasswordField("Password", passwordController),
              // ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
                  child: ScopedModelDescendant<AppModel>(
                      builder: (context, child, model) {
                    return RoundedButton(
                        "Google SSO",
                        context,
                        () => model.login(
                            emailController.text, passwordController.text));
                  })),
            ],
          ))),
    ));
  }
}
