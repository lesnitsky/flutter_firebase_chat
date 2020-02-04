import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:flutter_firebase_chat/entities/chat_list_state.dart';
import 'package:flutter_firebase_chat/screens/chat_screen.dart';
import 'package:flutter_firebase_chat/widgets/chat_avatar.dart';

final mockState = ChatListState(
  chats: [
    Chat(id: '1', title: 'Audience'),
    Chat(id: '2', title: 'Speakers'),
    Chat(id: '3', title: 'General'),
    Chat(id: '4', title: 'Info'),
  ],
);

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listState = mockState;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: listState.chats.length,
      itemBuilder: (context, index) {
        final chat = listState.chats[index];

        return ListTile(
          leading: ChatAvatar(title: chat.title),
          title: Text(chat.title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatScreen(title: chat.title),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(height: 4),
    );
  }
}
