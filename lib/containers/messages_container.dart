import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/message.dart';
import 'package:flutter_firebase_chat/entities/messages_state.dart';

class MessagesContainer extends StatefulWidget {
  final String chatId;
  final WidgetBuilder builder;

  const MessagesContainer({Key key, this.chatId, this.builder})
      : super(key: key);

  @override
  _MessagesContainerState createState() => _MessagesContainerState();
}

class _MessagesContainerState extends State<MessagesContainer> {
  Stream<QuerySnapshot> ref;

  @override
  void initState() {
    ref = Firestore.instance
        .collection('messages')
        .where('to', isEqualTo: widget.chatId)
        .orderBy('createdAt')
        .snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref,
      builder: (context, snapshot) => snapshot.hasData
          ? MessagesStateBuilder(
              messages: List<Message>.from(
                snapshot.data.documents.map((s) => Message.fromJson(s.data)),
              ),
              builder: (context, _) => widget.builder(context),
            )
          : Container(),
    );
  }
}
