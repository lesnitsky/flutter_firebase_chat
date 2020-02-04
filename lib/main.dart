import 'package:flutter/material.dart';

import 'package:flutter_firebase_chat/screens/chat_list_screen.dart';

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
