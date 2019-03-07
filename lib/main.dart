import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'dashboard.dart';
import 'screens/events.dart';

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
        "/" : (context) => LoginScreen(),
        "/events" : (context) => EventsScreen(),
      },
      // home: LoginScreen(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
