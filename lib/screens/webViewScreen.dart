// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';

// More info on this class: https://www.youtube.com/watch?v=RA-vLF_vnng&vl=en

class WebviewScreen extends StatelessWidget {
  final Event event;
  WebviewScreen({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return new WebviewScaffold(url: event.pardotUrl);
    // return WebView(
    //   initialUrl: event.pardotUrl,
    //   javascriptMode: JavascriptMode.unrestricted,
    // );
    return Scaffold(
        appBar: AppBar(
          title: Text(event.name),
        ),
        body: WebView(
          initialUrl: event.pardotUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
