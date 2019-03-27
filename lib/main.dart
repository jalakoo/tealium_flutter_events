import 'package:flutter/material.dart';
import 'screens/launch.dart';
import 'screens/loading.dart';
import 'screens/login.dart';
import 'screens/events.dart';
import 'screens/eventDetail.dart';
import 'screens/contacts.dart';
import 'screens/contactdetail.dart';
import 'screens/editcontact.dart';
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
            "/eventDetail": (context) => EventDetailScreen(),
            "/contacts": (context) => ContactsScreen(),
            "/contactdetail": (context) => ContactDetailScreen(),
            "/editcontact": (context) => EditContactScreen(),
          },
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
