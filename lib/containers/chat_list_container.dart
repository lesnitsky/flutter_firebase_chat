import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:flutter_firebase_chat/entities/chat_list_state.dart';

class ChatListContainer extends StatefulWidget {
  final WidgetBuilder builder;

  const ChatListContainer({Key key, this.builder}) : super(key: key);
  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  Stream<QuerySnapshot> ref;

  @override
  void initState() {
    ref = Firestore.instance.collection('chats').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ref,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final chats = List<Chat>.from(
            snapshot.data.documents.map(
              (s) => Chat.fromJson(s.data),
            ),
          );

          return ChatListStateBuilder(
            chats: chats,
            builder: (context, provider) {
              return widget.builder(context);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
