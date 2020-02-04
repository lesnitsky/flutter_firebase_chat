import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final String id;
  final String title;

  Chat({this.id, this.title});

  factory Chat.fromJson(Map<String, dynamic> data) => _$ChatFromJson(data);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
