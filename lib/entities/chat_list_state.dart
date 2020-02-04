import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:inherited_builder/annotations.dart';
import 'package:uuid/uuid.dart';

part 'chat_list_state.g.dart';

@Inherited()
class ChatListState {
  final List<Chat> chats;

  ChatListState({this.chats = const []});
}
