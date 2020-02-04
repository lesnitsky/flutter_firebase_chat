import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/containers/user_container.dart';

import 'package:flutter_firebase_chat/screens/chat_list_screen.dart';

void main() {
  runApp(FirebaseChatApp());
}

class FirebaseChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserContainer(
      child: MaterialApp(
        home: ChatListScreen(),
      ),
    );
  }
}
