import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat_list_state.dart';
import 'package:flutter_firebase_chat/screens/chat_screen.dart';
import 'package:flutter_firebase_chat/widgets/chat_avatar.dart';
import 'package:flutter_firebase_chat/widgets/chat_tile.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listState = ChatListStateProvider.of(context);

    return ListView.separated(
      itemCount: listState.chats.length,
      itemBuilder: (context, index) {
        final chat = listState.chats[index];

        return ChatTile(chat: chat);
      },
      separatorBuilder: (context, index) => Divider(height: 4),
    );
  }
}
