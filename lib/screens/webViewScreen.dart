import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter/material.dart';
import '../models/event.dart';

class WebviewScreen extends StatelessWidget {
  final Event event;
  WebviewScreen({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: event.pardotUrl);
  }
}
