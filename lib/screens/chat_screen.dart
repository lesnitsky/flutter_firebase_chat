import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String title;

  const ChatScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}
