import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:flutter_firebase_chat/screens/chat_screen.dart';
import 'package:flutter_firebase_chat/widgets/chat_avatar.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;

  const ChatTile({Key key, this.chat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(chat: chat),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChatAvatar(title: chat.title),
            ),
            Text(chat.title, style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      ),
    );
  }
}
