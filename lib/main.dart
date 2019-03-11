import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/events.dart';
import 'screens/eventDetail.dart';
import 'screens/contacts.dart';
import 'screens/contactdetail.dart';
import 'screens/editcontact.dart';

// Main runloop
void main() => runApp(MyApp());

// Stateless App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tealium Events App",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
        "/events": (context) => EventsScreen(),
        "/eventDetail": (context) => EventDetailScreen(),
        "/contacts": (context) => ContactsScreen(),
        "/contactdetail": (context) => ContactDetailScreen(),
        "/editcontact": (context) => EditContactScreen(),
      },
      // home: LoginScreen(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
