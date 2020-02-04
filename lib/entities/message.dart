import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String from;
  final String to;
  final String content;
  final String createdAt;

  Message({
    this.id,
    this.to,
    this.from,
    this.content,
    this.createdAt,
  });

  factory Message.create(BuildContext context, String text, String to) {
    return new Message(
      content: text,
      from: UserProvider.of(context).id,
      to: to,
      id: Uuid().v1(),
      createdAt: DateTime.now().toUtc().toIso8601String(),
    );
  }

  factory Message.fromJson(Map<String, dynamic> data) =>
      _$MessageFromJson(data);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
