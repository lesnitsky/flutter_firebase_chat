import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/message.dart';
import 'package:inherited_builder/annotations.dart';

part 'messages_state.g.dart';

@Inherited()
class MessagesState {
  final List<Message> messages;

  MessagesState({this.messages});
}

extension MessageActions on MessagesStateProvider {
  send(BuildContext context, String text, String to) async {
    final message = Message.create(context, text, to);

    await Firestore.instance
        .collection('messages')
        .document(message.id)
        .setData(message.toJson());
  }
}
