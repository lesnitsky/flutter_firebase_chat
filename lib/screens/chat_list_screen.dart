import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/containers/chat_list_container.dart';
import 'package:flutter_firebase_chat/screens/new_chat_screen.dart';
import 'package:flutter_firebase_chat/screens/profile_screen.dart';
import 'package:flutter_firebase_chat/widgets/chat_list.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 40,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
      ),
      body: ChatListContainer(
        builder: (context) => ChatList(),
      ),
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
