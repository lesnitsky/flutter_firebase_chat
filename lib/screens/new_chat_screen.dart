import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/widgets/submit_new_chat_button.dart';

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
            SubmitNewChatButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
