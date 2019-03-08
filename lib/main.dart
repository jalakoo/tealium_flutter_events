import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/events.dart';
import 'screens/contacts.dart';

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
        "/contacts": (context) => ContactsScreen(),
      },
      // home: LoginScreen(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
