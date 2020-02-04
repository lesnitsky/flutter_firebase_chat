import 'package:flutter/material.dart';
import 'package:inherited_builder/annotations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@Inherited()
class User {
  final String name;
  final String id;

  const User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
