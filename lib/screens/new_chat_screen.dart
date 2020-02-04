import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(),
            ),
            FlatButton(
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
