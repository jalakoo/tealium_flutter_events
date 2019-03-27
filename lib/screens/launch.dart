import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'events.dart';
import 'loading.dart';
import 'login.dart';
import '../ui.dart';
import '../utils/logger.dart';
import '../models/appmodel.dart';

class LaunchController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LaunchControllerState();
  }
}

class LaunchControllerState extends State<LaunchController> {
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
        return LoadingScreen();
      } else if (!model.isLoading && model.user == null) {
        log.verbose("Model has finished checking for user. None found.");
        LoginScreen login = LoginScreen();
        login.model = model;
        login.emailController = emailController;
        login.passwordController = passwordController;
        return login;
        // return _login(context);
      } else {
        log.verbose(
            "Model found pre-existing user. Displaying mock dashboard...");
        EventsScreen events = EventsScreen();
        return events;
      }
    });
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
  }
}
