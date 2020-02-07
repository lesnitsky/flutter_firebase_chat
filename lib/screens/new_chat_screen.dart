import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:flutter_firebase_chat/screens/chat_screen.dart';
import 'package:flutter_firebase_chat/widgets/submit_new_chat_button.dart';
import 'package:uuid/uuid.dart';

class NewChatScreen extends StatelessWidget {
  final controller = new TextEditingController();

  Future<void> createChat(BuildContext context) async {
    final id = Uuid().v1();

    Firestore.instance
        .collection('chats')
        .document(id)
        .setData(Chat(id: id, title: controller.text).toJson());

    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
        builder: (context) => ChatScreen(
          chat: Chat(id: id, title: controller.text),
        ),
      ),
    );
  }

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
                onSubmitted: (_) {
                  createChat(context);
                },
              ),
            ),
            SubmitNewChatButton(
              controller: controller,
              onSubmitted: () {
                createChat(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
