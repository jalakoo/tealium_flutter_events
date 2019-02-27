import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';

// Main runloop
void main() => runApp(MyApp());

// Stateless App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tealium Events App",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
