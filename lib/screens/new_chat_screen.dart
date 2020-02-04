import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New chat'),
      ),
      body: Column(
        children: <Widget>[
          TextField(),
          FlatButton(
            child: Text('Create'),
          ),
        ],
      ),
    );
  }
}