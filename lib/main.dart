import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());

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
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => LoginScreen(),
              settings: settings,
            );

          case '/home':
            return new MyCustomRoute(
              builder: (_) => DashboardScreen(),
              settings: settings,
            );
        }
      },
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
