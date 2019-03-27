import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ui.dart';
import '../utils/logger.dart';
import '../models/appmodel.dart';
import 'events.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(AppModel model, String email, String password) {
    log.verbose("Attempting to login...");
    model.login(email, password);
    // TODO: Present UI feedback that page is attempting to login
  }

  Widget _pageToDisplay() {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      if (model.isLoading) {
        log.verbose("Model is loading user.");
        return _loading(context);
      } else if (!model.isLoading && model.user == null) {
        log.verbose("Model has finished checking for user. None found.");
        return _login(context);
      } else {
        log.verbose(
            "Model found pre-existing user. Displaying mock dashboard...");
        EventsScreen events = EventsScreen();
        return events;
      }
    });
  }

  Widget _loading(BuildContext context) {
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
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: CircularProgressIndicator()),
            ],
          ))),
    ));
  }

  Widget _login(BuildContext context) {
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
              RoundedTextField("Email", emailController),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: RoundedPasswordField("Password", passwordController),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ScopedModelDescendant<AppModel>(
                      builder: (context, child, model) {
                    return RoundedButton(
                        "Login",
                        context,
                        () => login(model, emailController.text,
                            passwordController.text));
                  })),
            ],
          ))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageToDisplay(),
    );
    // return Scaffold(
    //     // ScrollView allows for UI to adjust if textfield is under keyboard
    //     body: SingleChildScrollView(
    //   // Almost all widgets have a child or children property to nest objects with
    //   child: Padding(
    //       padding: LoginPadding(context),
    //       child: Center(
    //           child: Column(
    //         children: <Widget>[
    //           ImageContainer("assets/tealium_logo_120x200.png"),
    //           Padding(padding: EdgeInsets.all(20.0)),
    //           RoundedTextField("Email"),
    //           Padding(
    //             padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    //             child: RoundedPasswordField("Password"),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    //             child: RoundedButton("Login", context, () => login(context)),
    //             // () => Navigator.pushNamed(context, "/events")),
    //           ),
    //         ],
    //       ))),
    // ));
  }
}
