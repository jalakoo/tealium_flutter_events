import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'events.dart';
import 'loading.dart';
import 'login.dart';
import '../utils/logger.dart';
import '../models/appmodel.dart';

// This class handles the initial app load - login - main
// dashboard (eventsScreen) presentation, separate from the
// navigation router process as this did not gel well with
// the scoped model architecture as we currently understand it.

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
    log.verbose("launchController: login: Attempting login...");
    model.login(email, password);
    // TODO: Present UI feedback that page is attempting to login
  }

  Widget _pageToDisplay() {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      if (model.isLoading) {
        log.verbose("launchController: _pageToDisplay: appModel is loading...");
        return LoadingScreen();
      }
      if (!model.hasLoaded && model.user == null) {
        log.verbose(
            "launchController: _pageToDisplay: appModel is loading from memory...");
        model.load();
        return LoadingScreen();
      }
      if (!model.isLoading && model.user == null) {
        log.verbose(
            "launchController: _pageToDisplay: appModel did not find a previously saved user.");
        LoginScreen login = LoginScreen();
        login.model = model;
        login.emailController = emailController;
        login.passwordController = passwordController;
        return login;
      }
      log.verbose(
          "launchController: _pageToDisplay: appModel found prior user.");
      EventsScreen events = EventsScreen();
      return events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageToDisplay(),
    );
  }
}
