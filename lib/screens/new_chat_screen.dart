import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget {
  final controller = new TextEditingController();

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
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Chat title'),
                controller: controller,
              ),
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
