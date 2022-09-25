import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telefon Dairesi'),
      ),
      body: Container(
          child: WebView(
        initialUrl: 'http://www.telefondairesi.com',
        allowsInlineMediaPlayback: true,
        debuggingEnabled: false,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: "flutter",
              onMessageReceived: (JavascriptMessage message) {
                if (message.message == "onSubscribeClick") {
                  print("onSubscribeClick");
                }
              })
        ]),
        onWebResourceError: (websourceerror) {
          print(websourceerror.domain.toString());
        },
      )),
    );
  }
}
