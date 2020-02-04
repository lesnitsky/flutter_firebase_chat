import 'package:flutter/material.dart';

void main() {
  runApp(FirebaseChatApp());
}

class FirebaseChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatListScreen(),
    );
  }
}
