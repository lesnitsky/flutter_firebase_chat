import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/messages_state.dart';
import 'package:flutter_firebase_chat/entities/user.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    final messagesProvider = MessagesStateProvider.of(context);

    final messages = messagesProvider.messages.reversed.toList();
    final userProvider = UserProvider.of(context);

    return ListView.builder(
      reverse: true,
      itemCount: messagesProvider.messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isOwn = message.from == userProvider.id;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment:
                isOwn ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: isOwn ? Colors.blue : Colors.grey[300],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  message.content,
                  style: TextStyle(
                      fontSize: 16, color: isOwn ? Colors.white : Colors.black),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
