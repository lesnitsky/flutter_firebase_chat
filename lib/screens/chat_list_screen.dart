import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/screens/new_chat_screen.dart';
import 'package:flutter_firebase_chat/widgets/chat_list.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chats')),
      body: ChatList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => NewChatScreen(),
            ),
          );
        },
      ),
    );
  }
}
