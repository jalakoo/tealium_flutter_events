import 'package:events/screens/webViewScreen.dart';
import 'package:flutter/material.dart';
import 'screens/launchController.dart';
import 'screens/settingsScreen.dart';
import 'screens/eventsScreen.dart';
import 'screens/webViewScreen.dart';
import 'screens/contactsScreen.dart';
import 'screens/contactDetailScreen.dart';
import 'screens/editContactScreen.dart';
import 'models/appmodel.dart';
import 'package:scoped_model/scoped_model.dart';

// Main runloop
void main() => runApp(MyApp());

// Stateless App
class MyApp extends StatelessWidget {
  final AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: appModel,
        child: MaterialApp(
          title: "Tealium Events App",
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => LaunchController(),
            "/events": (context) => EventsScreen(),
            "/contacts": (context) => ContactsScreen(),
            "/contactdetail": (context) => ContactDetailScreen(),
            "/editcontact": (context) => EditContactScreen(),
            "/settings": (context) => SettingsScreen(),
            "/webview": (context) => WebviewScreen()
          },
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
