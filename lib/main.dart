import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mi_card/utils/connection_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyCard());
}

final ConnectionService _connectionService = ConnectionService();

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(LineAwesomeIcons.info),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationVersion: '1.0.0',
                    applicationIcon: Icon(LineAwesomeIcons.external_link),
                    applicationLegalese: 'My Online Card');
              }),
        ),
        body: _connectionService.hasConnection
            ? WebView(
                initialUrl: 'https://kherld-hussein.github.io/me.io/',
                javascriptMode: JavascriptMode.unrestricted,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
